using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;

namespace Web
{
    public partial class Params : System.Web.UI.Page
    {
       public static string projectConnectionString = "metadata=res://*/ModelDB.csdl|res://*/ModelDB.ssdl|res://*/ModelDB.msl;provider=System.Data.SqlClient;provider connection string=\"data source=DESKTOP-TFT1E9S;initial catalog=Dogov;integrated security=True;multipleactiveresultsets=True;App=EntityFramework\"";
       public static bool testConnection()
       {
           try
           {
               SqlConnection test = new SqlConnection("Data Source=" + getServerName() + ";Initial Catalog=" + getDbName() + ";Integrated Security=true;");
               test.Open();
               if (test.State == ConnectionState.Open)
               {
                   test.Close();
                   return true;
               }
               else
                   return false;
           }
           catch (Exception w)
           {
               return false;
           }
       }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Сервер.Text = getServerName();
                Название.Text = getDbName();
            }
        }
        
      
        static string getServerName()
        {
            string[] data = projectConnectionString.Split(';');
            string[] strs = data[2].Split('=');
            return strs[strs.Length - 1];
        }
        static string getDbName()
        {
            string[] data = projectConnectionString.Split(';');
            string[] strs = data[3].Split('=');
            return strs[strs.Length - 1];
        }
        protected void NewUser_Click(object sender, EventArgs e)
        {
            projectConnectionString = "metadata=res://*/ModelDB.csdl|res://*/ModelDB.ssdl|res://*/ModelDB.msl;provider=System.Data.SqlClient;provider connection string=\"data source=" + Сервер.Text + ";initial catalog=" + Название.Text + ";integrated security=True;multipleactiveresultsets=True;App=EntityFramework\"";
            Page.Response.Redirect("/Dogovor.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("/Dogovor.aspx");
        }
    }
}