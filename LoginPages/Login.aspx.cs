using System;
using System.Configuration;
using System.Data.SqlClient;

public partial class LoginPages_Login : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		
	}

	protected void btnLogin_Click(object sender, EventArgs e)
	{
		string userName = tbUserName.Text.Trim();
		string searchUserName = "select * from tb_UserInfo where U_UserName = '" + userName + "'";
		string passWord = tbPassWord.Text.Trim();
		string searchPassWord = "select * from tb_UserInfo where U_UserName='" + userName + "' and U_PassWord ='" + passWord + "'";
		if (userName == "")
		{
			Response.Write("<script languge='javascript'>alert('请填写用户名！！！');</script>");
		}
		else if (passWord == "")
		{
			Response.Write("<script languge='javascript'>alert('请填写密码！！！');</script>");
		}
		else if(userName!=""&&passWord!="") {
			//SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["conStr"]);
			//SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["conStr"].ConnectionString);
			//con.Open();
			//string sqlSelect = "select count(*) from tb_UserInfo where U_UserName = '" + userName + "' and U_PassWord='" + passWord + "'";
			//SqlCommand com = new SqlCommand(sqlSelect, con);
			//检查用户名和密码
			if (Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar(searchUserName)) == 0)
			{
				Response.Write("<script languge='javascript'>alert('用户名错误！');</script>");
			}
			else if (Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar(searchPassWord)) == 0)
			{
				Response.Write("<script languge='javascript'>alert('密码错误！');</script>");
			}
			else
			{
				string sqlSelect = "select count(*) from tb_UserInfo where U_UserName=@username and U_PassWord=@password";
				SqlParameter[] pms = new SqlParameter[] {
					new SqlParameter("@username", userName),
					new SqlParameter("@password", passWord)
				};
				string sqlGetRole = "select U_Role from tb_UserInfo where U_UserName=@username1";
				SqlParameter[] pms1 = new SqlParameter[]{
					new SqlParameter("@username1", userName)
				};
				int r = Convert.ToInt32(DBHelper.DBHelper.ExecuteScalar(sqlSelect, pms));
				string role = DBHelper.DBHelper.ExecuteScalar(sqlGetRole, pms1).ToString();
				if (r > 0)
				{
					Session["UserName"] = tbUserName.Text.Trim();
					if (role == "系统操作员")
					{
						Response.Redirect("../Admin/Index.aspx");
					}
					else if (role == "普通用户")
					{
						Response.Redirect("../Students/S_Index.aspx");
					}
					else if (role == "教师")
					{
						Response.Redirect("../Teachers/T_Index.aspx");
					}
				}
				else
				{
					Response.Write("<script languge='javascript'>alert('用户名或密码错误！');</script>");
				}
			}
		}
	}

	protected void btnReset_Click(object sender, EventArgs e)
	{
		tbUserName.Text = "";
		tbPassWord.Text = "";
	}
}