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
            MySqlConnection conn = new DBConnection().getConnection();
            String pw ;
            String sql = "SELECT login.`password` FROM waterboarddb.login where login.userName = @un;";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
           cmd.Parameters.Add(new MySqlParameter("un", un));
            
            MySqlDataReader rdr = cmd.ExecuteReader(); 
            if (rdr.Read())
            {               
                pw = rdr[0].ToString();

            }else
            {
                pw = null;
            }
            conn.Close();
            return pw;

            
        }


       // closing the connection
    }
}
