using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OluWebsite
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                //protect section
                //ProtectSection("connectionStrings", "DataProtectionConfigurationProvider");
                //ProtectSection("appSettings", "DataProtectionConfigurationProvider");

                //UnProtectSection("connectionStrings");
                //UnProtectSection("appSettings");
            }
        }

        private void ProtectSection(string sectionName, string provider = "DataProtectionConfigurationProvider")
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);

            ConfigurationSection section = config.GetSection(sectionName);

            if (section != null && !section.SectionInformation.IsProtected)
            {
                section.SectionInformation.ProtectSection(provider);
                config.Save();
            }
        }

        private void UnProtectSection(string sectionName)
        {
            Configuration config = WebConfigurationManager.OpenWebConfiguration(Request.ApplicationPath);

            ConfigurationSection section = config.GetSection(sectionName);

            if (section != null && section.SectionInformation.IsProtected)
            {
                section.SectionInformation.UnprotectSection();
                config.Save();
            }
        }

        protected void BtnContactUs_Click(object sender, EventArgs e)
        {
            LblMessage.Text = "";
            string name = TxtName.Text.Trim();

            //serverside validation
            if (string.IsNullOrWhiteSpace(name))
            {
                LblMessage.Text = "Please enter name";
            }
            else
            {
                string email = TxtEmail.Text.Trim();

                //set up message to send
                StringBuilder msg = new StringBuilder();
                msg.Append($"<p><strong>Name:</strong> {name}</p>");
                msg.Append($"<p><strong>Email:</strong> {email}</p>");
                msg.Append($"<p><strong>Subject:</strong> {DdlSubject.Text}</p>");
                msg.Append($"<p><strong>Message:</strong> {TxtMessage.Text}</p>");

                try
                {
                    ////create an instance of SmtpClient
                    //SmtpClient client = new SmtpClient("smtp.gmail.com");

                    //string dotpeakEmail = "dotpeaktester@gmail.com";

                    ////set the credentials
                    //client.Credentials = new NetworkCredential(dotpeakEmail,
                    //    "trainingdragon2018$");

                    ////enable ssl
                    //client.EnableSsl = true;

                    //send the email
                    //client.Send(email, dotpeakEmail, 
                    //    $"Message from website on {DateTime.Now}", msg.ToString());


                    SmtpClient client = new SmtpClient();

                    MailMessage mailMessage =
                        new MailMessage(email, ConfigurationManager.AppSettings["dotPeakEmail"],
                        $"Message from website on {DateTime.Now}", msg.ToString())
                        {
                            IsBodyHtml = true
                        };

                    //send the email
                    client.Send(mailMessage);


                    LblMessage.ForeColor = Color.Green;
                    LblMessage.Text = "Message sent. Thank you";
                }
                catch (Exception)
                {
                    LblMessage.ForeColor = Color.Red;
                    LblMessage.Text = "Unable to send message, pls call 080callmenow";
                }
            }

        }

        private void ClearForm()
        {
            //empty the fields
            TxtName.Text = "";
            TxtEmail.Text = "";
            DdlSubject.SelectedIndex = 0;
            TxtMessage.Text = "";
        }
    }
}