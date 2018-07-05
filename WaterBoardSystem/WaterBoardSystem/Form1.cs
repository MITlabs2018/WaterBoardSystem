using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using WaterBoardSystem.Controller;


namespace WaterBoardSystem
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string unEntered = textBoxUn.Text;
            string pwEntered = textBoxPw.Text;
            String password;
            try
            {
                if(new LoginController().getPassword(unEntered) != null)
                {
                     password = new LoginController().getPassword(unEntered);
                    if (password.Equals(pwEntered))
                    {
                        MessageBox.Show("Login succesful");
                    }
                    else{
                        MessageBox.Show("Incorrect Password");
                    }
                }
                else
                {
                    MessageBox.Show("Incorrect username");
                }
                
                
                  
            }
            catch (MySqlException)
            {
                MessageBox.Show("Could not connect to Database ");
                
            }

            Console.Out.Write("test");
        }
    }
}
