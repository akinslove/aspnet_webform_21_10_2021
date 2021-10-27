using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OluWebsite
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImgBtnAddToBasket_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBasket = sender as ImageButton; //technique 1
            ImageButton imgBasket2 = (ImageButton)sender; //technique 2

            //What is the difference between technique 1 and 2 above

            //Both are used to cast an object but there is a difference
            //The first technique will either cast if sender is an ImageButton 
            //or set imgBasket to null 
            //while the second technique will throw an invalidcastexception if 
            //sender is not an ImageButton

            //The choice of casting is yours based on what you desire
             if (imgBasket != null)
            {
                string pid = imgBasket.CommandArgument;

                LblMessage.Text = $"product id is {pid}";
            }

        }
    }
}