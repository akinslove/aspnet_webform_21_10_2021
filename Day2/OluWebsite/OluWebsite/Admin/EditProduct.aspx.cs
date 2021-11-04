using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OluWebsite.Admin
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        private void LoadProduct()
        {
            string pid = DdlProducts.SelectedValue;

            //pid = string.IsNullOrWhiteSpace(pid) ? "1" : pid;

            if (!string.IsNullOrWhiteSpace(pid))
            {
                //a product was selected
                string query =
                    $"Select * from products where pid={pid}";

                try
                {
                    using (DbHandler dbHandler = new DbHandler())
                    {
                        DataTable dt = dbHandler.GetData(query);

                        if (dt != null)
                        {
                            //a product exist
                            TxtProductName.Text = dt.Rows[0]["pname"] as string ?? "";
                        }
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        protected void DdlProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProduct();
        }
    }
}