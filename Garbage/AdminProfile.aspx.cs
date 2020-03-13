using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Xml;
using System.Data;

namespace Garbage
{
	public partial class AdminProfile : System.Web.UI.Page
	{
		SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CmsConnection"].ConnectionString);
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		// Green Force Member Selected from DataGrid
		protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
		{
			GridViewRow gr = GridView1.SelectedRow;
			name.Text = gr.Cells[2].Text;
			username.Text = gr.Cells[1].Text;
			Email.Text = gr.Cells[6].Text;
			memberstat.Text = gr.Cells[7].Text;

		}

		// Assign Captain
		protected void Button2_Click(object sender, EventArgs e)
		{
			try
			{
				connection.Open();
				string CommandText = "UPDATE Members SET member_type='captain' where username='"+username.Text+"' " ;
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label1.Text = "User assigned as a captain successfully";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('AdminProfile.aspx') },3000);", true);
			}
			catch (Exception ex)
			{
				Label1.Text = ex.Message;
			}
		}

		// Remove Captain
		protected void remomveCap_Click(object sender, EventArgs e)
		{
			try
			{
				connection.Open();
				string CommandText = "UPDATE Members SET member_type='member' where username='" + username.Text + "' ";
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label1.Text = "User assigned as a member successfully";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('AdminProfile.aspx') },3000);", true);
			}
			catch (Exception ex)
			{
				Label1.Text = ex.Message;
			}
		}

		// Delete User
		protected void Button1_Click(object sender, EventArgs e)
		{
			try
			{
				connection.Open();
				string CommandText = "DELETE FROM Members where username='" + username.Text + "' ";
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label1.Text = "User deleted successfully";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('AdminProfile.aspx') },3000);", true);
			}
			catch (Exception ex)
			{
				Label1.Text = ex.Message;
			}
		}

		public String HashPassword(String pass)
		{
			Byte[] bytes = System.Text.Encoding.Unicode.GetBytes(pass);
			String EncPssowrd = Convert.ToBase64String(bytes);
			return EncPssowrd;
		}

		public string decryptPassword(string pass)
		{

			byte[] Bytes = Convert.FromBase64String(pass);
			string decryptedpass = System.Text.Encoding.Unicode.GetString(Bytes);
			return decryptedpass;

		}


		// Create Staff Account
		protected void createStaffAcc_Click(object sender, EventArgs e)
		{
			try
			{
				SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CmsConnection"].ConnectionString);
				connection.Open();
				string Checkuser = "Select COUNT(*) from Staff where staffUername='" + staffusername.Text + "'";
				SqlCommand command = new SqlCommand(Checkuser, connection);

				int temp = Convert.ToInt32(command.ExecuteScalar().ToString());
				if (temp == 1)
				{
					usernametaken.Text = "Username already taken";
				}
				else
				{

					string CommandText = "INSERT INTO Staff (staffUername,name,password) VALUES(@staffUername,@name,@password)";
					SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
					Insertcommand.Parameters.AddWithValue("@staffUername", staffusername.Text);
					Insertcommand.Parameters.AddWithValue("@name", staffname.Text);
					Insertcommand.Parameters.AddWithValue("@password", HashPassword(staffpassword.Text));
					

					Insertcommand.ExecuteNonQuery();
					Label2.Text = "Account Created Successfully";
					ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('AdminProfile.aspx/#createSAcc') },0000);", true);

				}

				connection.Close();
			}
			catch (Exception ex)
			{
				Label2.Text = ex.Message;
			}

		}

		protected void collectingStaff_PageIndexChanged(object sender, EventArgs e)
		{
			Response.Redirect("AdminProfile.aspx/#createSAcc");
			
		}
		// Collecting Staff  Selected from DataGrid
		protected void collectingStaff_SelectedIndexChanged(object sender, EventArgs e)
		{
			
			GridViewRow gr = collectingStaff.SelectedRow;
			staffname.Text = gr.Cells[2].Text;
			staffusername.Text = gr.Cells[1].Text;
			staffpassword.Text = decryptPassword(gr.Cells[3].Text);
			
		}

		// update Staff Account
		protected void Button3_Click(object sender, EventArgs e)
		{
			try
			{
				connection.Open();
				string CommandText = "UPDATE Staff Set name='" + staffname.Text + "',password='" + HashPassword(staffpassword.Text) + "' where staffUername='" + staffusername.Text + "' ";
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label2.Text = "Account Updated";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('AdminProfile.aspx/#createSAcc') },0000);", true);

			}
			catch (Exception ex)
			{
				Label2.Text = ex.Message;
			}
		}

		// delete Staff Account
		protected void Button5_Click(object sender, EventArgs e)
		{
			try
			{
				connection.Open();
				string CommandText = "DELETE Staff where staffUername='" + staffusername.Text + "' ";
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label2.Text = "Account Deleted";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('AdminProfile.aspx/#createSAcc') },0000);", true);

			}
			catch (Exception ex)
			{
				Label2.Text = ex.Message;
			}
		}

		// Insert Article
		protected void Button4_Click(object sender, EventArgs e)
		{
			var random = new Random();
			int aritleID = random.Next(0, 10000);

			XmlDocument xmldoc = new XmlDocument();
			xmldoc.Load(Server.MapPath("~/App_Data/Articles.xml"));
			XmlElement parentElement = xmldoc.CreateElement("Article");
			XmlElement AritleID = xmldoc.CreateElement("AritleID");
			AritleID.InnerText = aritleID.ToString();
			XmlElement AritleTitle = xmldoc.CreateElement("ArticleTitle");
			AritleTitle.InnerText = articleTitle.Text;
			XmlElement AtitleSummary = xmldoc.CreateElement("ArticleDesc");
			AtitleSummary.InnerText = articleDesc.Text;
			parentElement.AppendChild(AritleID);
			parentElement.AppendChild(AritleTitle);
			parentElement.AppendChild(AtitleSummary);

			xmldoc.DocumentElement.AppendChild(parentElement);
			xmldoc.Save(Server.MapPath("~/App_Data/Articles.xml"));

			ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
			"setTimeout(function() { window.location.replace('Articles.aspx') },3000);", true);
		}

		protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
		{

			GridViewRow gr = GridView2.SelectedRow;
			aID.Text = gr.Cells[1].Text;
			articleTitle.Text = gr.Cells[2].Text;
			articleDesc.Text = gr.Cells[3].Text;
			
		}

		protected void deleteArtcile_Click(object sender, EventArgs e)
		{
			//delete
			try
			{
				XmlDocument xdoc = new XmlDocument();
			xdoc.Load(Server.MapPath("~/App_Data/Articles.xml"));
			foreach (XmlNode xNode in xdoc.SelectNodes("Articles/Article"))
			if (xNode.SelectSingleNode("AritleID").InnerText == aID.Text) xNode.ParentNode.RemoveChild(xNode);
			xdoc.Save(Server.MapPath("~/App_Data/Articles.xml"));

				Label3.Text = "Article Deleted";
			}
			catch (Exception ex)
			{
				Label3.Text = ex.Message;
			}
			
			Response.Redirect("Articles.aspx");
		}

		protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			
		}

		


	}
}