using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OluWebsite.Admin
{

    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Reset();
            }
        }

        protected void BtnAddProduct_Click(object sender, EventArgs e)
        {
            string name = TxtName.Text.Trim();
            string description = TxtDescription.Text.Trim();
            string price = TxtPrice.Text.Trim();
            string stock = TxtStock.Text.Trim();
            string imageName = "noimage.jpg";

            if (string.IsNullOrWhiteSpace(name))
            {
                //display name error
                LblMessage.Text = "Please enter product name";
            }
            else if (!price.IsADecimal())
            {
                //display price error
                LblMessage.Text = "Please enter only numbers for price";
            }
            else if (!stock.IsANumber())
            {
                //display stock error
                LblMessage.Text = "Please enter only numbers for stock";
            }
            else
            {
                //check if file is uploaded
                if (FileUploadImage.HasFile)
                {
                    //check if it is an image
                    if (FileUploadImage.PostedFile.ContentType == "image/jpeg"
                        || FileUploadImage.PostedFile.ContentType == "image/png")
                    {
                        //save image name
                        imageName = FileUploadImage.FileName;

                        try
                        {

                            //save file
                            FileUploadImage.SaveAs(
                                Server.MapPath($"~/ProductImages/{imageName}"));

                        }
                        catch (HttpException)
                        {
                            LblMessage.Text = "Unable to upload image, pls contact IT Support";
                        }

                        
                    }
                    else
                    {
                        LblMessage.Text = "Please upload jpeg or png images";
                    }

                }

                try
                {
                    //save in db
                    int result = AddProductToDatabase(name, description, price, imageName, stock);

                    if (result > 0)
                    {
                        LblMessage.Text = "Product added successfully";
                    }
                    else
                    {
                        LblMessage.Text = "Product not added, pls contact IT Support";
                    }
                }
                catch (SqlException ex)
                {
                    LblMessage.Text = "Unable to add product, pls contact IT Support";
                }
            }

        }

        private static int AddProductToDatabase(string name, string description, string price, string imageName, string stock)
        {
            //query
            string query =
                $"Insert Into Products(pname,pdescription,pprice,pimage,stock) " +
                $"Values('{name}','{description}','{price}','{imageName}','{stock}');";

            //create a new instance dbHandler
            DbHandler dbHandler = new DbHandler();

            //save to db
            int result = dbHandler.ExecuteQuery(query);

            return result;
        }


        private void Reset()
        {
            TxtName.Text = "";
            TxtDescription.Text = "";
            TxtPrice.Text = "5.50";
            TxtStock.Text = "10";
            FileUploadImage.Dispose();
        }
    }
}