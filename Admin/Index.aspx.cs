using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Index : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			Bind();
			//绑定部门数据
			BindDepDDL();
			//绑定课件目录
			BindCourseDDL();
			//绑定课件内容
			BindCourseFiles();
		}
	}

	public void Bind()
	{
		string dataSearch = "select * from tb_UserInfo";
		if (DBHelper.DBHelper.ExecuteDataTable(dataSearch).Rows.Count != 0)
		{
			gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(dataSearch);
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

		//如果是绑定数据行 
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
			{
				((LinkButton)e.Row.Cells[8].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}
	protected void gvUser_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvUser.EditIndex = e.NewEditIndex;
		Bind();
	}

	protected void gvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvUser.EditIndex = -1;
		Bind();
	}

	protected void gvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_UserInfo where U_ID='" + gvUser.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		Bind();
	}

	/// <summary>
	/// GridView自带的更新要注意、细心
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	protected void gvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_UserInfo set U_UserName='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "', U_ChineseName='" 
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim() + "', U_Sex='" 
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim() + "', U_DepartmentName='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim() + "', U_Role='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim() + "', U_PhoneNum='"
			+ ((TextBox)(gvUser.Rows[e.RowIndex].Cells[6].Controls[0])).Text.ToString().Trim() + "' where U_ID= '" + gvUser.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvUser.EditIndex = -1;
		Bind();
	}

	protected void gvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvUser.PageIndex = e.NewPageIndex;
		Bind();
	}

	protected void ddlSearchDepartment_SelectIndexChange(object sender, EventArgs e)
	{
		string selectedText = ddlSearchDepartment.SelectedItem.Text.Trim();
		string sqlSearch = "select * from tb_UserInfo where U_DepartmentName=@department";
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

	protected void ddlSearchRole_SelectIndexChange(object sender, EventArgs e)
	{
		string selectedText = ddlSearchRole.SelectedItem.Text.Trim();
		string sqlSearch = "select * from tb_UserInfo where U_Role=@userrole";
		string sqlSearch1 = "select * from tb_UserInfo where U_Role='" + selectedText + "'";
		SqlParameter[] pms = new SqlParameter[]{
			new SqlParameter("@userrole", selectedText)
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

	protected void btnSearch_Click(object sender, EventArgs e)
	{
		string inputedText = tbSearchUserName.Text.Trim();
		string sqlSearch = "select * from tb_UserInfo where U_UserName='" + inputedText + "'";
		if (DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count == 0)
		{
			Response.Write("<script>alert('没有该用户！！！');window.location='../Admin/Index.aspx'</script>");
		}
		else
		{
			gvUser.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
			gvUser.DataKeyNames = new string[] { "U_ID" };
			gvUser.DataBind();
		}
	}


	/// <summary>
	/// 课件相关操作
	/// </summary>
	protected void BindCourseDDL()
	{
		string selectCourseFiles = "select * from tb_CourseFiles";
		if (DBHelper.DBHelper.ExecuteDataTable(selectCourseFiles).Rows.Count != 0)
		{
			ddlContentBelong.Items.Clear();
			ddlContentBelong.DataSource = DBHelper.DBHelper.ExecuteDataTable(selectCourseFiles);
			ddlContentBelong.DataTextField = "CF_CFileContent";
			ddlContentBelong.DataValueField = "CF_CFileID";
			ddlContentBelong.DataBind();
			ddlContentBelong.Items.Insert(0, new ListItem("---请选择课件所属目录---", "0"));
		}
	}

	protected void BindCourseFiles()
	{
		int currentPage = Convert.ToInt32(this.labCurrentPage.Text);
		PagedDataSource ps = new PagedDataSource();
		string sqlSearch = "select * from tb_CourseFiles";
		ps.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch).DefaultView;
		ps.AllowPaging = true;
		ps.PageSize = 9;
		ps.CurrentPageIndex = currentPage - 1;
		this.lbFirstPage.Enabled = true;
		this.lbFrontPage.Enabled = true;
		this.lbNextPage.Enabled = true;
		this.lbLastPage.Enabled = true;

		if(currentPage ==1)
		{
			this.lbFirstPage.Enabled = false;//不显示第一页按钮
			this.lbFrontPage.Enabled = false;//不显示上一页按钮
		}
		if(currentPage == ps.PageCount)
		{
			this.lbNextPage.Enabled = false;
			this.lbLastPage.Enabled = false;
		}
		this.labTotalPage.Text = Convert.ToString(ps.PageCount);
		dlCourseContent.DataSource = ps;
		dlCourseContent.DataKeyField = "CF_CFileID";
		dlCourseContent.DataBind();
	}

	protected void btnSearchCourse_Click(object sender, EventArgs e)
	{
		string inputValue = tbFileName.Text.Trim();
		string sqlSearch = "select * from tb_CourseFiles where CF_CFileName = '" + inputValue +"'";
		if(inputValue == "" || DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count == 0)
		{
			Response.Write("<script>alert('没有该课件！！！');window.location='../Admin/Index.aspx'</script>");
			BindCourseFiles();
		}
		else
		{
			dlCourseContent.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
			dlCourseContent.DataKeyField = "CF_CFileID";
			dlCourseContent.DataBind();
		}
	}

	protected void ddlContentBelong_SelectIndexChange(object sender, EventArgs e)
	{
		string getValue = ddlContentBelong.SelectedItem.Text.Trim();
		string sqlSearch = "select * from tb_CourseFiles where CF_CFileContent = '" + getValue +"'";
		if(DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count == 0)
		{
			BindCourseFiles();
		}
		else
		{
			dlCourseContent.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlSearch);
			//dlCourseContent.DataKeyField = "CF_CFileID";
			dlCourseContent.DataBind();
		}
	}

	protected void dlCourseContent_EditCommand(object sender, DataListCommandEventArgs e)
	{
		if ((e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem) && (Session["UserName"] != null))
		{
			string getID = dlCourseContent.DataKeys[e.Item.ItemIndex].ToString();//获取当前列
			((LinkButton)e.Item.Controls[0].FindControl("lbtnEdit")).Attributes.Add("onclick", "window.open('../Admin/ModifyCourseFiles.aspx?id=" + getID + "','','width=680,height=660,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no').moveTo((1920-680)/2, (1080-660)/2)");
		}
		//dlCourseContent.EditItemIndex = e.Item.ItemIndex;
		//BindCourseFiles();
	}

	protected void dlCourseContent_DeleteCommand(object sender, DataListCommandEventArgs e)
	{
		string getID = dlCourseContent.DataKeys[e.Item.ItemIndex].ToString();//获取当前DataList控件列
		string sqlDelete = "delete from tb_CourseFiles where CF_CFileID= '" + Convert.ToInt32(getID) + "'";
		DBHelper.DBHelper.ExectueNonQuery(sqlDelete);
		BindCourseFiles();
	}

	protected void dlCourseContent_ItemDataBound(object sender, DataListItemEventArgs e)
	{
		if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
		{
			((LinkButton)e.Item.Controls[0].FindControl("lbtnDelete")).Attributes.Add("onclick", "return confirm('确定要删除吗？')");
		}
	}

	#region 分页技术
	protected void lbFirstPage_Click(object sender, EventArgs e)
	{
		this.labCurrentPage.Text = "1";
		this.BindCourseFiles();
	}

	protected void lbFrontPage_Click(object sender, EventArgs e)
	{
		this.labCurrentPage.Text = Convert.ToString(Convert.ToInt32(this.labCurrentPage.Text) - 1);
		this.BindCourseFiles();
	}

	protected void lbNextPage_Click(object sender, EventArgs e)
	{
		this.labCurrentPage.Text = Convert.ToString(Convert.ToInt32(this.labCurrentPage.Text) + 1);
		this.BindCourseFiles();
	}

	protected void lbLastPage_Click(object sender, EventArgs e)
	{
		this.labCurrentPage.Text = this.labTotalPage.Text;
		this.BindCourseFiles();
	}
	#endregion
}