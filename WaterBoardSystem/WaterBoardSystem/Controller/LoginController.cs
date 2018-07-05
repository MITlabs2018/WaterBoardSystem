using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace WaterBoardSystem.Controller
{
    class LoginController
    {
        public string getPassword(String un)
        {
            MySqlConnection conn = new DBConnection().getConnection(); // grtting the dayabse connection class
            String pw ;
            String sql = "SELECT login.`password` FROM waterboarddb.login where login.userName = @un;";
            MySqlCommand cmd = new MySqlCommand(sql, conn); // creting the  new sql commnad
           cmd.Parameters.Add(new MySqlParameter("un", un)); // adding parameters 
            
            MySqlDataReader rdr = cmd.ExecuteReader(); 
            if (rdr.Read()) // recursively displaying the data
            {               
                pw = rdr[0].ToString(); // getting elements in data reader array

            }else
            {
                pw = null;
            }
            conn.Close();  // closing the connection
            return pw;

            
        }


      
    }
}
