using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Webascx_Header : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["UserName"] == null)
		{
			Response.Write("<script languge='javascript'>alert('请先登录！');window.location.href='../LoginPages/Login.aspx'</script>");
		}
		else
		{
			string chineseName = "select U_ChineseName from tb_UserInfo where U_UserName = @username";
			SqlParameter[] pms = new SqlParameter[] {
				new SqlParameter("@username", Session["UserName"].ToString())
			};
			string name = DBHelper.DBHelper.ExecuteScalar(chineseName, pms).ToString();
			lbTips.Text = name + "，欢迎您！";
		}
	}

	protected void lbExit_Click(object sender, EventArgs e)
	{
		Session.Clear();
		Session.Abandon();
		this.Response.Redirect("../LoginPages/Login.aspx"); // 退出并跳转到登录页
	}

	//人员管理
	protected void lbUserManager_Click(object sender, EventArgs e)
	{
		Response.Redirect("Index.aspx");
	}

	protected void lbDepartInfo_Click(object sender, EventArgs e)
	{
		Response.Redirect("OrgDepJob.aspx");
	}

	protected void lbUserInfo_Click(object sender, EventArgs e)
	{
		Response.Redirect("AddUserInfo.aspx");
	}

	//课程管理
	protected void lbCourseManager_Click(object sender, EventArgs e)
	{
		Response.Redirect("ShowTask.aspx");
	}

	protected void lbCourseClassify_Click(object sender, EventArgs e)
	{
		Response.Redirect("AddCourseandContent.aspx");
	}

	protected void lbAddCourses_Click(object sender, EventArgs e)
	{
		Response.Redirect("AddCourseFiles.aspx");
	}
}