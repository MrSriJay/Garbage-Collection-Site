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
	public partial class Posts : System.Web.UI.Page
	{
		SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["CmsConnection"].ConnectionString);
		protected void Page_Load(object sender, EventArgs e)
		{
			SqlDataSource1.SelectCommand = " SELECT * FROM Post order by datePosted";
		}

		protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			
		}
		

		protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{

			
		}

		protected void Repeater1_Load(object sender, EventArgs e)
		{
			
		}

		protected void verification_SelectedIndexChanged(object sender, EventArgs e)
		{
			
		}

		protected void verification_TextChanged(object sender, EventArgs e)
		{
			
		}

		// Filter
		protected void search_Click(object sender, EventArgs e)
		{
			if (verification.SelectedItem.Value == "All Posts")
			{
				SqlDataSource1.SelectCommand = " SELECT * FROM Post order by datePosted ";
			}
			else if(verification.SelectedItem.Value == "All Verified Posts")
			{
				SqlDataSource1.SelectCommand = " SELECT * FROM Post WHERE validatition = 'YES' order by datePosted,importance_level desc ";

			}
			else if (verification.SelectedItem.Value == "All Unverified Posts")
			{
				SqlDataSource1.SelectCommand = " SELECT * FROM Post WHERE validatition = 'NO' order by datePosted ";
			}
		}
	}
}