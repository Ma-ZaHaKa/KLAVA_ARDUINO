using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp3
{
    public partial class Form2 : Form
    {
        public int val;
        public bool exit = false;
        public Form2()
        {
            InitializeComponent();
        }

        public void button1_Click(object sender, EventArgs e)
        {
            exit = true;
            Close();
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
           label4.Text = $"x{(61 - (val = trackBar1.Value)).ToString()}";
        }

    }
}
