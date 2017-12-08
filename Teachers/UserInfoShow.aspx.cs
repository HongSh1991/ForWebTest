using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teachers_UserInfoShow : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Bind();
			BindDepDDL();
		}
	}

	public void Bind()
	{
		string dataSearch = "select * from tb_UserInfo";
		if (DBHelper.DBHelper.ExecuteDataTable(dataSearch).Rows.Count != 0)
		{
			string sqlSearch = "select * from tb_UserInfo where U_Role = '普通用户'";
			gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
			gvUser.DataKeyNames = new string[] { "U_ID" };
			gvUser.DataBind();
		}
	}

	protected void gvUser_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		//显示每条记录前的数据
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvUser.PageIndex) * gvUser.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}


	}

	protected void ddlSearchDepartment_SelectIndexChange(object sender, EventArgs e)
	{
		string selectedText = ddlSearchDepartment.SelectedItem.Text.Trim();
		string sqlSearch = "select * from tb_UserInfo where U_DepartmentName=@department and U_Role='普通用户'";
		string sqlSearch1 = "select * from tb_UserInfo where U_DepartmentName='" + selectedText + "'";
		SqlParameter[] pms = new SqlParameter[]{
			new SqlParameter("@department", selectedText)
		};
		if (DBHelper.DBHelper.ExecuteDataTable(sqlSearch1).Rows.Count == 0)
		{
			Bind();
		}
		else
		{
			gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch, pms);
			gvUser.DataKeyNames = new string[] { "U_ID" };
			gvUser.DataBind();
		}
	}

	protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvUser.PageIndex = e.NewPageIndex;
		Bind();
	}

	protected void BindDepDDL()
	{
		//string sqlCheck = "select * from tb_UserInfo, tb_Department";
		//if (DBHelper.DBHelper.ExecuteDataTable(sqlCheck).Rows.Count != 0)
		//{
		//	string sqlSelect = "select * from tb_UserInfo a, tb_Department b where a.U_DepID=b.D_DepID";
		//	ddlSearchDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSelect);
		//	ddlSearchDepartment.DataTextField = "U_DepartmentName";
		//	ddlSearchDepartment.DataValueField = "U_ID";
		//	ddlSearchDepartment.DataBind();
		//	ddlSearchDepartment.Items.Insert(0, new ListItem("---请选择部门名称---", "0"));
		//}
		string sqlCheck = "select * from tb_UserInfo";
		if (DBHelper.DBHelper.ExecuteDataTable(sqlCheck).Rows.Count != 0)
		{
			string sqlSelect = "select distinct[U_DepID], U_DepartmentName from tb_UserInfo";
			ddlSearchDepartment.Items.Clear();
			ddlSearchDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSelect);

			// Add@HongSh 2017-11-27 SQL 语句过滤重复项要尽量以重复的ID作为主键！！！！例如将下面的DataValueField = “U_ID”改成“U_DepID”
			ddlSearchDepartment.DataTextField = "U_DepartmentName";
			ddlSearchDepartment.DataValueField = "U_DepID";
			ddlSearchDepartment.DataBind();
			ddlSearchDepartment.Items.Insert(0, new ListItem("---请选择部门名称---", "0"));
		}
	}

	//protected void ddlSearchRole_SelectIndexChange(object sender, EventArgs e)
	//{
	//	string selectedText = ddlSearchRole.SelectedItem.Text.Trim();
	//	string sqlSearch = "select * from tb_UserInfo where U_Role=@userrole";
	//	string sqlSearch1 = "select * from tb_UserInfo where U_Role='" + selectedText + "'";
	//	SqlParameter[] pms = new SqlParameter[]{
	//		new SqlParameter("@userrole", selectedText)
	//	};
	//	if (DBHelper.DBHelper.ExecuteDataTable(sqlSearch1).Rows.Count == 0)
	//	{
	//		Bind();
	//	}
	//	else
	//	{
	//		gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch, pms);
	//		gvUser.DataKeyNames = new string[] { "U_ID" };
	//		gvUser.DataBind();
	//	}
	//}

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		string inputedText = tbSearchUserName.Text.Trim();
		string sqlSearch = "select * from tb_UserInfo where U_UserName='" + inputedText + "' and U_DepartmentName='" + ddlSearchDepartment.SelectedItem.Text + "'";
		if (DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count == 0)
		{
			Response.Write("<script>alert('没有该用户！！！');window.location=''</script>");
		}
		else
		{
			gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
			gvUser.DataKeyNames = new string[] { "U_ID" };
			gvUser.DataBind();
		}
	}

	protected void lbtnUserName_Click(object sender, EventArgs e)
	{
		string linkButtonText = ((LinkButton)sender).Text.ToString();
		//Response.Write("<script>window.location='../Students/S_Index.asox?UserName=" + linkButtonText + "'</script>");
		Response.Redirect("S_Student.aspx?UserName="+linkButtonText);
	}
}