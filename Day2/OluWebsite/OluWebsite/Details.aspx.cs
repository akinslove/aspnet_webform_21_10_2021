using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OluWebsite
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImgBtnAddToBasket_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBasket = sender as ImageButton;

            if (imgBasket != null)
            {
                string pid = imgBasket.CommandArgument;

                string query =
                    $"Insert into Basket(pid,bsessionid) Values('{pid}', '{Session.SessionID}');";

                try
                {
                    using (DbHandler dbhandle = new DbHandler())
                    {
                        int result = dbhandle.ExecuteQuery(query);

                        if (result > 0)
                        {
                            LblMessage.Text = "Product added to basket";
                        }
                        else
                        {
                            LblMessage.Text = "Product not added, pls contact IT Support";
                        }
                    }
                }
                catch (SqlException ex)
                {
                    LblMessage.Text = "Error occured, please contact IT Support";
                }
            }
        }
    }
}