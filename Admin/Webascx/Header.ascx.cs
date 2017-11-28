using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Webascx_Header : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		
	}

	protected void lbExit_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../LoginPages/Login.aspx"); // 退出并跳转到登录页
	}
}