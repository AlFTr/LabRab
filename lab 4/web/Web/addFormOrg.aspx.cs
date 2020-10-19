using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class addFormOrg : System.Web.UI.Page
    {
        static bool isEdit = false;
        static int editId = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
           
             Button1.Attributes.Add("OnClick", "return confirm('Вы действительно хотите удалить запись?');");
            Button1.Visible = false; ;
            if (!Page.IsPostBack)
            {
                try
                {
                    int id = Convert.ToInt32(Request.Params["ID"]);
                    ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
                    Организация пользователь =
                      (from п in model.ОрганизацияНабор where п.Номер == id select п).First();
                    isEdit = true;

                    Название.Text = пользователь.Название;
                    ФИО_Начальника.Text = пользователь.ФИО_Начальника;
                    Адрес.Text = пользователь.Адрес;
                    editId = id;
                    Button1.Visible = true;
                }
                catch (Exception w) { isEdit = false; }
            } 
        }

        protected void NewUser_Click(object sender, EventArgs e)
        {
            ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
            Организация организация;
            if (isEdit)
            {
                int id = editId;
                организация =
                 (from п in model.ОрганизацияНабор where п.Номер == id select п).First();
            }
            else
            {
                организация = new Организация();

            }
            организация.Название = Название.Text.Trim();
            организация.ФИО_Начальника = ФИО_Начальника.Text.Trim();
            организация.Адрес = Адрес.Text.Trim();

            if (isEdit)
                model.SaveChanges();
            else
                model.ОрганизацияНабор.AddObject(организация); model.SaveChanges();

            Page.Response.Redirect("/"); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("/Org.aspx"); 
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
            int id = editId;
            Контактное_Лицо лицо = (from п in model.Контактное_ЛицоНабор where п.Номер == id select п).First();
            model.DeleteObject(лицо);
            model.SaveChanges();
            Page.Response.Redirect("/Org.aspx");
        }
    }
}