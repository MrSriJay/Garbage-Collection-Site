using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garbage
{
	public partial class Contact : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		// Sending an message to admin
		protected void submit_Click(object sender, EventArgs e)
		{
			try
			{
				MailMessage mailMessage = new MailMessage();
				mailMessage.From = new MailAddress("gforcemunici@gmail.com");
				mailMessage.To.Add("gforcemunici@gmail.com");
				mailMessage.Subject = subject.Text;
				mailMessage.Body ="<b>Sender Name: </b>" +name.Text+"<br/><b>Sender Email: </b>"+email.Text + "<br/><b>Sender Message: </b>" + message.Text;
				mailMessage.IsBodyHtml = true;

				SmtpClient smtpClient = new SmtpClient("smtp.gmail.com",587);
				smtpClient.EnableSsl = true;
				smtpClient.Credentials = new System.Net.NetworkCredential("gforcemunici@gmail.com", "asd123.4");
				smtpClient.Send(mailMessage);

				textMess.Text = "Your message has been submitted";
				name.Text = "";
				subject.Text = "";
				email.Text = "";
				message.Text = "";

			}
			catch (Exception ex)
			{
				textMess.Text = ex.Message;
			}
		}
	}
}