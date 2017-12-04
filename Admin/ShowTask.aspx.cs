using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ShowTask : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			//绑定课件目录
			BindCourseDDL();
			//绑定课件内容
			BindCourseFiles();
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
		string sqlSearch = "select * from tb_CourseFiles where CF_CFileName = '" + inputValue + "'";
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

	protected void lbtnEdit_Click(object sender, EventArgs e)
	{
		string id1 = ((LinkButton)sender).ToolTip.Trim().ToString();
		Response.Redirect("ModifyCourseFiles.aspx?id="+id1);
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
		if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
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