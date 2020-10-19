using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class addFormFace : System.Web.UI.Page
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
                    Контактное_Лицо пользователь =
                      (from п in model.Контактное_ЛицоНабор where п.Номер == id select п).First();
                    isEdit = true;

                    ФИО.Text = пользователь.ФИО;
                    Телефон.Text = пользователь.Телефон;
                    Место_работы.Text = пользователь.Место_работы;
                    Персональные_данные.Text = пользователь.Персональные_данные;
                    Адрес_проживания.Text = пользователь.Адрес_проживания;
                    editId = id;
                    Button1.Visible = true;
                }
                catch (Exception w) { isEdit = false; }
            } 
        }

        protected void NewUser_Click(object sender, EventArgs e)
        {
            ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
            Контактное_Лицо лицо;
            if (isEdit)
            {
                int id = editId;
                лицо =
                 (from п in model.Контактное_ЛицоНабор where п.Номер == id select п).First();
            }
            else
            {
                лицо = new Контактное_Лицо();

            }
            лицо.ФИО = ФИО.Text.Trim();
            лицо.Телефон = Телефон.Text.Trim();
            лицо.Место_работы = Место_работы.Text.Trim();
            лицо.Адрес_проживания = Адрес_проживания.Text.Trim();
            лицо.Персональные_данные = Персональные_данные.Text.Trim();

            if (isEdit)
                model.SaveChanges();
            else
                model.Контактное_ЛицоНабор.AddObject(лицо); model.SaveChanges();

            Page.Response.Redirect("/"); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("/"); 
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
            int id = editId;
            Контактное_Лицо лицо = (from п in model.Контактное_ЛицоНабор where п.Номер == id select п).First();
            model.DeleteObject(лицо);
            model.SaveChanges();
            Page.Response.Redirect("/"); 
        }
    }
}