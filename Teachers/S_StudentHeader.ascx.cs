using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Students_S_StudentHeader : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		//if (Session["UserName"] == null)
		//{
		//	Response.Write("<script languge='javascript'>alert('请先登录！');window.location.href='../LoginPages/Login.aspx'</script>");
		//}
		//else
		//{
		//	string chineseName = "select U_ChineseName from tb_UserInfo where U_UserName = @username";
		//	SqlParameter[] pms = new SqlParameter[] {
		//		new SqlParameter("@username", Session["UserName"].ToString())
		//	};
		//	string name = DBHelper.DBHelper.ExecuteScalar(chineseName, pms).ToString();
		//	lbTips.Text = name + "，欢迎您！";
		//}
	}

	//protected void lbExit_Click(object sender, EventArgs e)
	//{
	//	Session.Clear();
	//	Session.Abandon();
	//	this.Response.Redirect("../LoginPages/Login.aspx"); // 退出并跳转到登录页
	//}
}