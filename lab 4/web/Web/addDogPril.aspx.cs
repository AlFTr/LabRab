using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class addDogPril : System.Web.UI.Page
    {
        static int currentDogId;// = -1;
        static List<int> dogIds;
        static bool isEdit = false;
        static int editId = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Attributes.Add("OnClick", "return confirm('Вы действительно хотите удалить запись?');");
            Button1.Visible = false;
               
            if (!Page.IsPostBack)
            {
                try
                {
                    currentDogId = Convert.ToInt32(Request.Params["IDDOG"]);
                    int id = Convert.ToInt32(Request.Params["ID"]);
                    ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
                    ПриложениеДоговора пользователь =
                      (from п in model.ПриложениеДоговораНабор where п.Номер == id select п).First();
                    isEdit = true;

                    ТипДокумента.Text = пользователь.ТипДокумента;
                    Содержание.Text = пользователь.Содержание;
                    ДатаСоставления.SelectedDate = Convert.ToDateTime(пользователь.ДатаСоставления);
                    editId = id;
                    Button1.Visible = true;
                }
                catch (Exception w) { isEdit = false; }
            } 
        }

        protected void NewUser_Click(object sender, EventArgs e)
        {
            ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
            ПриложениеДоговора приложение;
            if (isEdit)
            {
                int id = editId;
                приложение =
                 (from п in model.ПриложениеДоговораНабор where п.Номер == id select п).First();
            }
            else
            {
                приложение = new ПриложениеДоговора();

            }
            приложение.ТипДокумента = ТипДокумента.Text.Trim();
            приложение.Содержание = Содержание.Text.Trim();
            приложение.ДатаСоставления = ДатаСоставления.SelectedDate.ToShortDateString();
            приложение.Договор = (from a in model.ДоговорНабор where a.Номер == currentDogId select a).First();
            if (isEdit)
                model.SaveChanges();
            else
                model.ПриложениеДоговораНабор.AddObject(приложение); model.SaveChanges();

            Page.Response.Redirect("/dogPril.aspx?ID=" + currentDogId.ToString()); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("/dogPril.aspx?ID=" + currentDogId.ToString()); 
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
            int id = editId;
            ПриложениеДоговора лицо = (from п in model.ПриложениеДоговораНабор where п.Номер == id select п).First();
            model.DeleteObject(лицо);
            model.SaveChanges();
            Page.Response.Redirect("/dogPril.aspx?ID=" + currentDogId.ToString());
        }
    }
}