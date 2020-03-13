using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;

namespace Garbage
{

	public partial class Signup : System.Web.UI.Page
	{
		
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
		
		}

		// encrypt password 
		public String HashPassword(String pass)
		{
			Byte[] bytes = System.Text.Encoding.Unicode.GetBytes(pass);
			String EncPssowrd = Convert.ToBase64String(bytes);
			return EncPssowrd;
		}

		// Sign Up
		protected void Button1_Click1(object sender, EventArgs e)
		{
			try
			{
				SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CmsConnection"].ConnectionString);
				connection.Open();
				string Checkuser = "Select COUNT(*) from Members where username='" + username.Text + "'";
				SqlCommand command = new SqlCommand(Checkuser, connection);

				int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
				if (temp == 1)
				{
					usernameError.Text = "Username already taken";
				}
				else
				{

					string CommandText = "INSERT INTO Members (username,password,name,district,area,telephone,email) VALUES(@username,@password,@name,@district,@area,@telephone,@email)";
					SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
					Insertcommand.Parameters.AddWithValue("@username", username.Text);
					Insertcommand.Parameters.AddWithValue("@password", HashPassword(pass.Text));
					Insertcommand.Parameters.AddWithValue("@name", name.Text);
					Insertcommand.Parameters.AddWithValue("@district", district.Text);
					Insertcommand.Parameters.AddWithValue("@area", area.Text);
					Insertcommand.Parameters.AddWithValue("@telephone", telephone.Text);
					Insertcommand.Parameters.AddWithValue("@email", email.Text);

					Insertcommand.ExecuteNonQuery();

					// *********Sending a Mail to the user  **********
					String mail = email.Text.ToString();
					MailMessage mailMessage = new MailMessage();
					mailMessage.From = new MailAddress("gforcemunici@gmail.com");
					mailMessage.To.Add(mail);
					mailMessage.Subject = "Green Task Force Membership";
					mailMessage.Body = "<h3>Thank you for joining The Green Task Force </h3><br><p><i>Environmental pollution is an incurable disease. It can only be prevented. - <b>Barry Commoner</b> </i></p>";
					mailMessage.IsBodyHtml = true;

					SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
					smtpClient.EnableSsl = true;
					smtpClient.Credentials = new System.Net.NetworkCredential("gforcemunici@gmail.com", "asd123.4");
					smtpClient.Send(mailMessage);

					//*****************

					Label2.Text = "Account Created Successfully";
					ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
					"setTimeout(function() { window.location.replace('Home.aspx') },4000);", true);
				}

				connection.Close();
			}
			catch(Exception ex)
			{
				Label2.Text = ex.Message;
			}
		}

		protected void username_TextChanged(object sender, EventArgs e)
		{

		}
	}
}