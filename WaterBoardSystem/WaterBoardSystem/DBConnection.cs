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
                // provide the deatils regard to the server , db name , username , pw
                String server = "localhost";
                String database = "waterboarddb";
                string uid = "root";
                String password = "mysql";
                String connectionString = "SERVER=" + server + ";" + "DATABASE=" +
            database + ";" + "UID=" + uid + ";" + "PASSWORD=" + password + ";SslMode=none;port=3305";
                // if the port is not 3306, it should be mentioned
                // if ssl error is shown - sslmode = null 
                MySqlConnection cnn = new MySqlConnection(connectionString);
                cnn.Open(); // openng the connection


                return cnn; // retruning the connection
            }
            catch (MySqlException)
            {

                throw; // throw any mysqlExceptions 
            }
        }


    }
}

