﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teachers_TaskListShow : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			BindCourseDDL();
			BindCourseFiles();
		}
	}

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
		ps.PageSize = 8;
		ps.CurrentPageIndex = currentPage - 1;
		this.lbFirstPage.Enabled = true;
		this.lbFrontPage.Enabled = true;
		this.lbNextPage.Enabled = true;
		this.lbLastPage.Enabled = true;

		if (currentPage == 1)
		{
			this.lbFirstPage.Enabled = false;//不显示第一页按钮
			this.lbFrontPage.Enabled = false;//不显示上一页按钮
		}
		if (currentPage == ps.PageCount)
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
		string sqlSearch = "select * from tb_CourseFiles where CF_CFileName = '" + inputValue + "' and CF_CFileContent= '" + ddlContentBelong.SelectedItem.Text + "'";
		if (inputValue == "" || DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count == 0)
		{
			Response.Write("<script>alert('没有该课件！！！');window.location=''</script>");
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
		string sqlSearch = "select * from tb_CourseFiles where CF_CFileContent = '" + getValue + "'";
		if (DBHelper.DBHelper.ExecuteDataTable(sqlSearch).Rows.Count == 0)
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