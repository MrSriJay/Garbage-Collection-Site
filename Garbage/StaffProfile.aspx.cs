using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;

namespace Garbage
{
	public partial class StaffProfile1 : System.Web.UI.Page
	{
		SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CmsConnection"].ConnectionString);
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				String sql = "SELECT * FROM Staff WHERE staffUername ='" + Session["Staff"] + "'";
				SqlCommand comm = new SqlCommand(sql, connection);
				connection.Open();
				SqlDataReader nwReader = comm.ExecuteReader();
				while (nwReader.Read())
				{
					hello.Text = " Hello " + nwReader["name"].ToString();
					desc.Text = "You are a Green Task Force Collecting Staff Member. ";

				}
				nwReader.Close();
				connection.Close();
				SqlDataSource1.SelectCommand = "SELECT * FROM Post where validatition='YES'";
			}
			catch (Exception ex)
			{


			}



		}

		protected void SqlDataSource1_Load(object sender, EventArgs e)
		{

		}

		protected void searchbtn_Click(object sender, EventArgs e)
		{
			if (Searchimportancelevel.SelectedItem.Value == "All")
			{
				SqlDataSource1.SelectCommand = " SELECT * FROM Post WHERE validatition = 'YES' ";
			}
			else
			{
				SqlDataSource1.SelectCommand = " SELECT * FROM Post WHERE validatition = 'YES' AND importance_level = '" + Searchimportancelevel.SelectedItem.ToString() + "'";
			}
		}

		protected void Searchimportancelevel_SelectedIndexChanged(object sender, EventArgs e)
		{

		}

		protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
		{
			GridViewRow gr = GridView1.SelectedRow;
			UserPostID.Text = gr.Cells[1].Text;
			u_title.Text = gr.Cells[2].Text;
			u_description.Text = gr.Cells[3].Text;
			U_city.Text = gr.Cells[4].Text;
			U_Date.Text = gr.Cells[7].Text;
			U_User.Text = gr.Cells[10].Text;
			Image1.ImageUrl = gr.Cells[11].Text;
			hfLng.Value = gr.Cells[6].Text;
			hfLat.Value = gr.Cells[5].Text;

			if (gr.Cells[9].Text == "3")
			{
				UserImportanceL.Text = "Level 3: Clean immediately";
				UserImportanceL.ForeColor = Color.Red; 
			}
			else if (gr.Cells[9].Text == "2")
			{
				UserImportanceL.Text = "Level 2: Clean within a week";
				UserImportanceL.ForeColor = Color.Orange;
			}
			else if (gr.Cells[9].Text == "1")
			{
				UserImportanceL.Text = "Level 1: Clean within a month";
				UserImportanceL.ForeColor = Color.Blue;
			}
			Lat.Text = hfLat.Value;
			Lng.Text = hfLng.Value;

		}

		// Cleaned 
		protected void cleaned_Click(object sender, EventArgs e)
		{
			try
			{
				connection.Open();
				string CommandText = "DELETE FROM Post where  postId='" + UserPostID.Text + "' ";
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label1.Text = "Site Cleared";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('StaffProfile.aspx') },2000);", true);
			}
			catch (Exception ex)
			{
				Label1.Text = ex.Message;
			}
		}
	}
}