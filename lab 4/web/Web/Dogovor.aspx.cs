using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class Dogovor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Params.testConnection())
            {
                Response.Write("<script>alert('Подключение к базе данных не активно. Измените параметры подключения.');</script>");
                Page.Response.Redirect("/Params.aspx");
            }
            try
            {
                ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
                таблица.DataSource = from договор in model.ДоговорНабор select договор;
                Page.DataBind();
            }
            catch (Exception w) { }
        }

        protected void butAdd_Click1(object sender, EventArgs e)
        {
            Page.Response.Redirect("addFormDog.aspx");
        }
    }
}