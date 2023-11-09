using System;
using System.Reflection;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp3
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            this.Opacity = 0.0;
            InitializeComponent();
        }
        async void op()
        {
            /*await Task.Run(async () => {
                for (double i = 0; i < 1; i += .04)
                {
                    Opacity = i;
                    await Task.Delay(28);
                }
            });*/
            for (double i = 0; i < 1; i += .04)
            {
                Opacity = i;
                await Task.Delay(28);
            }
        }
        void Form1_Load(object sender, EventArgs e)
        {
            op();
            try
            {
                serialPort1.BaudRate = (9600);
                serialPort1.ReadTimeout = (2000);
                serialPort1.WriteTimeout = (2000);
                portbox.Items.AddRange(System.IO.Ports.SerialPort.GetPortNames());
                portbox.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ардуино подключи");
                Close();
            }

        }

        void button6_Click(object sender, EventArgs e)
        {
            serialPort1.Open();
            serialPort1.WriteLine("7");
            serialPort1.Close();
        }
        void button5_Click(object sender, EventArgs e)
        {
            serialPort1.Open();
            serialPort1.WriteLine("6");
            serialPort1.Close();
        }

        void button4_Click(object sender, EventArgs e)
        {
            DialogResult result = colorDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                serialPort1.Open();
                serialPort1.WriteLine($"5,{colorDialog1.Color.R},{colorDialog1.Color.G},{colorDialog1.Color.B}");
                serialPort1.Close();
            }
        }

        void button3_Click(object sender, EventArgs e)
        {
           DialogResult result = colorDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                serialPort1.Open();
                serialPort1.WriteLine($"4,{colorDialog1.Color.R},{colorDialog1.Color.G},{colorDialog1.Color.B}");
                serialPort1.Close();
            }
        }
        float map(float value, float fromLow, float fromHigh, float toLow, float toHigh)
        {
            return (value - fromLow) * (toHigh - toLow) / (fromHigh - fromLow) + toLow;
        }
        void button2_Click(object sender, EventArgs e)
        {
            DialogResult result = colorDialog1.ShowDialog();
            if (result == DialogResult.OK)
            {
                serialPort1.Open();
                if (checkBox1.Checked)
                {
                    serialPort1.WriteLine($"3,{colorDialog1.Color.R},{colorDialog1.Color.G},{colorDialog1.Color.B},{(int)map(colorDialog1.Color.GetBrightness(), 0, 1, 0, 255)}");
                }
                else
                {
                    serialPort1.WriteLine($"3,{colorDialog1.Color.R},{colorDialog1.Color.G},{colorDialog1.Color.B}");
                }
                serialPort1.Close();
            }
        }

        private void b0_Click(object sender, EventArgs e)
        {
            try
            {
                serialPort1.Open();
                serialPort1.WriteLine("0");
                serialPort1.Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void portbox_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                serialPort1.PortName = portbox.Text;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public static Task<object> GetTaskFromEvent(object o, string evt)
        {
            if (o == null || evt == null) throw new ArgumentNullException("Arguments cannot be null");

            EventInfo einfo = o.GetType().GetEvent(evt);
            if (einfo == null)
            {
                throw new ArgumentException(String.Format("*{0}* has no *{1}* event", o, evt));
            }

            TaskCompletionSource<object> tcs = new TaskCompletionSource<object>();
            MethodInfo mi = null;
            Delegate deleg = null;
            EventHandler handler = null;

            //код обработчика события
            handler = (s, e) =>
            {
                mi = handler.Method;
                deleg = Delegate.CreateDelegate(einfo.EventHandlerType, handler.Target, mi);
                einfo.RemoveEventHandler(s, deleg); //отцепляем обработчик события
                tcs.TrySetResult(null); //сигнализируем о наступлении события
            };

            mi = handler.Method;
            deleg = Delegate.CreateDelegate(einfo.EventHandlerType, handler.Target, mi); //получаем делегат нужного типа
            einfo.AddEventHandler(o, deleg); //присоединяем обработчик события
            return tcs.Task;
        }
        private async void button1_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
           await  GetTaskFromEvent(form2, "FormClosed");
            if (form2.exit)
            {
                //MessageBox.Show("Test");
                serialPort1.Open();
                serialPort1.WriteLine($"8,{form2.val}");
                serialPort1.Close();
            }
        }
    }
}
