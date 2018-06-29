using System;
using MySql.Data.MySqlClient;

using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace WaterBoardSystem
{
    public class DBConnection
    {


        public DBConnection()
        {
        }

        public MySqlConnection getConnection() 
        {
            try
            {
                String server = "localhost";
                String database = "waterboarddb";
                string uid = "root";
                String password = "mysql";
                String connectionString = "SERVER=" + server + ";" + "DATABASE=" +
            database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";SslMode=none;port=3305";
                MySqlConnection cnn = new MySqlConnection(connectionString);
                cnn.Open();


                return cnn;
            }
            catch (MySqlException)
            {

                throw;
            }
        }


    }
}

