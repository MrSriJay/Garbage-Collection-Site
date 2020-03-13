using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;


namespace Garbage
{
	public partial class Map : System.Web.UI.Page
	{
		
		protected void Page_Load(object sender, EventArgs e)
		{
			SqlDataSource1.SelectCommand = " SELECT * FROM Post order by datePosted";
		}


		// Filter
		protected void search_Click(object sender, EventArgs e)
		{
			if (verification.SelectedItem.Value == "All Posts")
			{
				SqlDataSource1.SelectCommand = " SELECT * FROM Post order by datePosted ";
			}
			else if (verification.SelectedItem.Value == "All Verified Posts")
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