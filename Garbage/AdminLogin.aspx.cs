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
	public partial class AdminLogin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			try
			{
				SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CmsConnection"].ConnectionString);
				connection.Open();
				string Checkuser = "Select COUNT(*) from admin where username='" + username.Text + "'";
				SqlCommand command = new SqlCommand(Checkuser, connection);
				int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
				connection.Close();
				if (temp == 1)
				{
					connection.Open();
					string PasswordCheckuser = "Select password from admin where username='" + username.Text + "'";
					SqlCommand passCommand = new SqlCommand(PasswordCheckuser, connection);
					string dbpassword = passCommand.ExecuteScalar().ToString();
					if (dbpassword == password.Text)
					{
						Session["admin"] = username.Text;
						Response.Redirect("AdminProfile.aspx");
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
			catch (Exception ex)
			{
				wrongPass.Text = ex.Message;
			}
		}
	}
}