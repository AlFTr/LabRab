using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class dogPril : System.Web.UI.Page
    {
        static int dogID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Params.testConnection())
            {
                Response.Write("<script>alert('Подключение к базе данных не активно. Измените параметры подключения.');</script>");
                Page.Response.Redirect("/Params.aspx");
            }
            try
            {
                int id = Convert.ToInt32(Request.Params["ID"]);
                dogID = id;
                ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
                таблица.DataSource = from п in model.ПриложениеДоговораНабор where п.Договор.Номер == id select п;
                lebDogName.Text = (from п in model.ДоговорНабор where п.Номер == id select п.Название).First(); 
                Page.DataBind();
            }
            catch (Exception w) { }
        }

        protected void butAdd_Click1(object sender, EventArgs e)
        {
            Page.Response.Redirect("/addDogPril.aspx?IDDOG=" + dogID.ToString());
        }
    }
}