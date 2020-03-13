using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Garbage
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		//Decrypt Password
		public string decryptPassword(string pass) {

			byte[] Bytes = Convert.FromBase64String(pass);
			string decryptedpass = System.Text.Encoding.Unicode.GetString(Bytes);
			return decryptedpass;

		}

		// Login User
		protected void Button1_Click(object sender, EventArgs e)
		{
			try
			{
				SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CmsConnection"].ConnectionString);
				connection.Open();
				string Checkuser = "Select COUNT(*) from Members where username='" + username.Text + "'";
				SqlCommand command = new SqlCommand(Checkuser, connection);
				int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
				connection.Close();
				if (temp == 1)
				{
					connection.Open();
					string PasswordCheckuser = "Select password from Members where username='" + username.Text + "'";
					SqlCommand passCommand = new SqlCommand(PasswordCheckuser, connection);
					string dbpassword = passCommand.ExecuteScalar().ToString();
					string decryptedpass = decryptPassword(dbpassword);
					if (decryptedpass == password.Text)
					{
						Session["member"] = username.Text;
						Response.Redirect("MemberProfile.aspx");
					}
					else
					{
						wrongPass.Text = "Wrong password or username";
					}
					connection.Close();

				}
				else
				{
					wrongPass.Text = "Wrong password or username";
				}
			}
			catch(Exception ex)
			{
				wrongPass.Text = ex.Message;
			}
		}
	}
}