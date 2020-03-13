using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Device.Location;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

namespace Garbage
{
	public partial class AddNewPost : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{
		
			if (Session["member"] == null)
			{
				Response.Redirect("Login.aspx");
			}
			else
			{

			}
		}


		// Add Post
		protected void Button1_Click(object sender, EventArgs e)
		{
			var random = new Random();
			int postid = random.Next(0,10000);
			try
			{

				HttpPostedFile postedFile = imgUpload.PostedFile;
				string filename = Path.GetFileName(postedFile.FileName);
				string fileExtention = Path.GetExtension(filename);
				int filesize = postedFile.ContentLength;
				
					if (imgUpload.PostedFile != null)
					{

						if (fileExtention.ToLower() == ".jpg" || fileExtention.ToLower() == ".png" || fileExtention.ToLower() == ".bmp" || fileExtention.ToLower() == "jpeg")
						{
							try
							{
								string imgfile = Path.GetFileName(imgUpload.PostedFile.FileName);
								imgUpload.SaveAs(Server.MapPath("~/img/post_images/" + imgfile));
								SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CmsConnection"].ConnectionString);
								connection.Open();
								string CommandText = "INSERT INTO Post (postId,postTitle,postDecription,city,latitude,longitude,datePosted,userid,img) VALUES(@postId,@postTitle,@postDecription,@city,@latitude,@longitude,@datePosted,@userid,@img)";
								SqlCommand Insertcommand = new SqlCommand(CommandText, connection);
								Insertcommand.Parameters.AddWithValue("@postId", postid);
								Insertcommand.Parameters.AddWithValue("@postTitle", title.Text);
								Insertcommand.Parameters.AddWithValue("@postDecription", decription.Text);
								Insertcommand.Parameters.AddWithValue("@city", DistrictDownList.SelectedItem.Text);
								Insertcommand.Parameters.AddWithValue("@latitude", latitude.Value.ToString());
								Insertcommand.Parameters.AddWithValue("@longitude", longitude.Value.ToString());
								Insertcommand.Parameters.AddWithValue("@datePosted", DateTime.Now.ToString());
								Insertcommand.Parameters.AddWithValue("@userid", Session["member"].ToString());
								Insertcommand.Parameters.AddWithValue("@img", "~/img/post_images/" + imgfile);

								Insertcommand.ExecuteNonQuery();

								Label1.Text = " Garbage site posted Successfully";
								ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS",
								"setTimeout(function() { window.location.replace('Posts.aspx') },4000);", true);
							}
							catch (Exception ex)
							{
								Label1.Text = ex.Message;
							}
						}
						else
						{
							imgError.Text = "File selected is not in correct format";
						}
					}
					else
					{
						imgError.Text = "Image must be added";
					}
				
				
			}
			catch (Exception ex)
			{
				Label1.Text = ex.Message;
			}
		}

		protected void Button1_PreRender(object sender, EventArgs e)
		{

		}
	}
}