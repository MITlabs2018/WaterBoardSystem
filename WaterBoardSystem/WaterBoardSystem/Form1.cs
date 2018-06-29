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
            try
            {
                MySqlConnection conn = new DBConnection().getConnection();
              //  String query = "SELECT * FROM waterboarddb.member;";
                MySqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT * FROM waterboarddb.member;";
                MySqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    Console.WriteLine(rdr[0].ToString());
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
