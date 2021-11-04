using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OluWebsite.Admin
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TxtProductName_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string query =
                    $"Select * From Products where pname like '%{TxtProductName.Text}%';";


                SqlDataSource1.SelectCommand = query;

                GridView1.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}