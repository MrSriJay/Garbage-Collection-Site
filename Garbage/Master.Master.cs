using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Garbage
{
	public partial class Master : System.Web.UI.MasterPage
	{
		public string sessionName;
		protected void Page_Load(object sender, EventArgs e)
		{

			if (Session["member"] != null)
			{
				sessionName=Session["member"].ToString();
				logoutbtn.Style.Add("display", "block");
				memberpro.Text= Session["member"].ToString();
				memberpro.Style.Add("display", "block");
				signupLink.Style.Add("display", "none");
				loginLink.Style.Add("display", "none");

			}
			else if (Session["admin"] != null)
			{
				sessionName = Session["admin"].ToString();
				logoutbtn.Style.Add("display", "block");
				memberpro.Text = Session["admin"].ToString();
				memberpro.Style.Add("display", "block");
				signupLink.Style.Add("display", "none");
				loginLink.Style.Add("display", "none");
			}
			else if (Session["Staff"] != null)
			{
				sessionName = Session["Staff"].ToString();
				logoutbtn.Style.Add("display", "block");
				memberpro.Text = Session["Staff"].ToString();
				memberpro.Style.Add("display", "block");
				signupLink.Style.Add("display", "none");
				loginLink.Style.Add("display", "none");
			}
			else
			{
				memberpro.Style.Add("display", "none");
				logoutbtn.Style.Add("display", "none");
			}
		}

		protected void logoutbtn_Click(object sender, EventArgs e)
		{
			Session["member"] = null;
			Session["admin"] = null;
			Session["Staff"] = null;
			Response.Redirect("Home.aspx");
		}

		protected void memberpro_Click(object sender, EventArgs e)
		{
			if (Session["member"] != null)
			{
				Response.Redirect("MemberProfile.aspx");
			}
			else if (Session["admin"] != null)
			{
				Response.Redirect("AdminProfile.aspx");
				memberpro.Text = "Admin Control Pannel";
			}
			else if (Session["Staff"] != null)
			{
				Response.Redirect("StaffProfile.aspx");
				
			}


		}
	}
}