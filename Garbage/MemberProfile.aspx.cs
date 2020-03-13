using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;

namespace Garbage
{
	
	public partial class MemberProfile : System.Web.UI.Page
	{
		SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CmsConnection"].ConnectionString);
		protected void Page_Load(object sender, EventArgs e)
		{
			try
			{
				String sql = "SELECT * FROM members WHERE username ='" + Session["member"] + "'";
				SqlCommand comm = new SqlCommand(sql, connection);
				connection.Open();
				SqlDataReader nwReader = comm.ExecuteReader();
				while (nwReader.Read())
				{
					hello.Text = " Hello " + nwReader["name"].ToString();
					if (nwReader["member_type"].ToString() == "member")
					{
						desc.Text = "You are currently assigned as a Green Task Force Member. ";
						greenPost.Visible = false;
					}
					else if (nwReader["member_type"].ToString() == "captain")
					{
						desc.Text = "You are currently assigned as a Green Task Force Captain. ";
						desc.Style.Add("color", "green");
						greenPost.Visible = true;
						
					}
				}
				nwReader.Close();
				connection.Close();
			}
			catch (Exception ex)
			{
				
		
			}

			

		}

		protected void postsSource_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
		{

		}

		protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
		{
			GridViewRow gr = GridView1.SelectedRow;
			id.Text = gr.Cells[1].Text;
			title.Text = gr.Cells[2].Text;
			description.Text = gr.Cells[3].Text;
			city.Text = gr.Cells[4].Text;
			date.Text = gr.Cells[7].Text;
			validation.Text = gr.Cells[8].Text;
			user.Text = gr.Cells[10].Text;
			Image2.ImageUrl = gr.Cells[11].Text ;
			hfLng.Value = gr.Cells[6].Text;
			hfLat.Value = gr.Cells[5].Text;
		}

		// Verify Post
		protected void Button2_Click(object sender, EventArgs e)
		{
			try
			{
				connection.Open();
				string CommandText = "UPDATE Post SET validatition='YES',importance_level='" + importancelevel.SelectedItem.ToString()+ "'  where  postId='" + id.Text + "' ";
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label1.Text = "Report Accepted";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('MemberProfile.aspx') },0000);", true);
			}
			catch (Exception ex)
			{
				Label1.Text = ex.Message;
			}
		}

		protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
		{

		}

		protected void Button3_Click(object sender, EventArgs e)
		{
	
		}

		protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
		{

			GridViewRow gr2 = GridView2.SelectedRow;
			UserPostID.Text = gr2.Cells[1].Text;
			u_title.Text = gr2.Cells[2].Text;
			u_description.Text = gr2.Cells[3].Text;
			U_city.SelectedValue = gr2.Cells[4].Text;
            Image1.ImageUrl = gr2.Cells[10].Text;

        }

		// Reject Report
		protected void Button1_Click(object sender, EventArgs e)
		{
			try
			{
				connection.Open();
				string CommandText = "DELETE FROM Post where postId='" + id.Text + "' ";
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label1.Text = "Report Rejected";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('MemberProfile.aspx') },0000);", true);
			}
			catch (Exception ex)
			{
				Label1.Text = ex.Message;
			}
		}


		// delete Post
		protected void Button4_Click(object sender, EventArgs e)
		{
			try
			{
				
				connection.Open();
				string CommandText = "DELETE FROM Post where postId='" + UserPostID.Text + "' ";
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label9.Text = "Post Deleted";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('MemberProfile.aspx') },0000);", true);
			}
			catch (Exception ex)
			{
				Label9.Text = ex.Message;
			}
		}

		// Update Button
		protected void Button3_Click1(object sender, EventArgs e)
		{
			try
			{
				connection.Open();
				string CommandText = "UPDATE Post Set postTitle='"+u_title.Text+ "',postDecription='" + u_description.Text + "',city='" + U_city.SelectedItem.ToString() + "' where postId='" + UserPostID.Text + "' ";
				SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
				Insertcommand.ExecuteNonQuery();

				connection.Close();
				Label9.Text = "Post Updated";
				ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
				"setTimeout(function() { window.location.replace('MemberProfile.aspx') },0000);", true);
			}
			catch (Exception ex)
			{
				Label9.Text = ex.Message;
			}
		}

		protected void Button5_Click(object sender, EventArgs e)
		{
			
		}
	}
}