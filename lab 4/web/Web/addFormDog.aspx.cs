using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class addFormDog : System.Web.UI.Page
    {
        static List<int> faceIds;
        static List<int> orgIds;
        static bool isEdit = false;
        static int editId = -1;
        protected void Page_Load(object sender, EventArgs e)
        {
            Button1.Attributes.Add("OnClick", "return confirm('Вы действительно хотите удалить запись?');");
            Button1.Visible = false; ;
            if (!IsPostBack)
            {
                ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
                НомерКонтактныхЛиц.DataSource = from п in model.Контактное_ЛицоНабор select п.ФИО;
                НомераОрганизации.DataSource = from п in model.ОрганизацияНабор select п.Название;
                faceIds = (from п in model.Контактное_ЛицоНабор select п.Номер).ToList<Int32>();
                orgIds = (from п in model.ОрганизацияНабор select п.Номер).ToList<Int32>();
                НомерКонтактныхЛиц.DataBind();
                НомераОрганизации.DataBind();
                try
                {
                    string str = Request.Params["ID"];
                    int id = Convert.ToInt32(Request.Params["ID"]);
                    Договор договор =
                      (from п in model.ДоговорНабор where п.Номер == id select п).First();
                    isEdit = true;

                    Название.Text = договор.Название;
                    Дата_начала.SelectedDate = договор.Дата_начала_действия;
                    Дата_конца.SelectedDate = договор.Дата_окончания_действия;
                    Максимальная_сумма.Text = договор.Максимальная_сумма.ToString();
                    НомерКонтактныхЛиц.SelectedIndex = getCurrentFace(Convert.ToInt32(договор.Контактное_Лицо.Номер));
                    НомераОрганизации.SelectedIndex = getCurrentOrg(Convert.ToInt32(договор.Организация.Номер));
                    editId = id;
                    Button1.Visible = true;
                }
                catch (Exception w) { isEdit = false; }
            }
        }
        int getCurrentFace(int id)
        {
            for (int i = 0; i < faceIds.Count; i++)
            {
                if (faceIds[i] == id)
                    return i;
            }
            return -1;
        }
        int getCurrentOrg(int id)
        {
            for (int i = 0; i < faceIds.Count; i++)
            {
                if (orgIds[i] == id)
                    return i;
            }
            return -1;
        }
        protected void NewUser_Click(object sender, EventArgs e)
        {
            ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
            Договор Договор;
            if (isEdit)
            {
                int id = editId;
                Договор =
                 (from п in model.ДоговорНабор where п.Номер == id select п).First();
            }
            else
                Договор = new Договор();
            Договор.Название = Название.Text.Trim();
            Договор.Дата_начала_действия = Дата_начала.SelectedDate;
            Договор.Дата_окончания_действия = Дата_конца.SelectedDate;
            Договор.Максимальная_сумма = Convert.ToDouble(Максимальная_сумма.Text.Trim());

            int idO = orgIds[НомераОрганизации.SelectedIndex];
            Договор.Организация = (from п in model.ОрганизацияНабор where п.Номер == idO select п).First();
            int idF = faceIds[НомерКонтактныхЛиц.SelectedIndex];
            Договор.Контактное_Лицо = (from п in model.Контактное_ЛицоНабор where п.Номер == idF select п).First();

            if (isEdit)
                model.SaveChanges();
            else
            {
                model.ДоговорНабор.AddObject(Договор);
                model.SaveChanges();
            }

            Page.Response.Redirect("/Dogovor.aspx"); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Response.Redirect("/Dogovor.aspx"); 
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            ModelDBContainer model = new ModelDBContainer(Params.projectConnectionString);
            int id = editId;
            Договор договор = (from п in model.ДоговорНабор where п.Номер == id select п).First();
            model.DeleteObject(договор);
            model.SaveChanges();
            Page.Response.Redirect("/Dogovor.aspx"); 
        }
    }
}