using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class Org : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ModelDBContainer model = new ModelDBContainer();
                таблица.DataSource = from орг in model.ОрганизацияНабор select орг;
                Page.DataBind();
            }
            catch (Exception w) { }
        }

        protected void butAdd_Click1(object sender, EventArgs e)
        {
            Page.Response.Redirect("addFormOrg.aspx");
        }
    }
}