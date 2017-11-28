using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Courseascx_AddCourse : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			//绑定数据至课程名称ddl
			string couName = "select * from tb_Course";
			ddlCourse.DataSource = DBHelper.DBHelper.ExecuteDataTable(couName);
			ddlCourse.DataTextField = "C_CouName";
			ddlCourse.DataValueField = "C_CouID";
			ddlCourse.DataBind();
			
			BindCourse();
			BindCourseContent();
		}
	}

	#region 课程分类
	protected void btnSaveCourse_Click(object sender, EventArgs e)
	{
		string checkNull = "select * from tb_Course";
		DataTable dtCheck = DBHelper.DBHelper.ExecuteDataTable(checkNull);
		if (dtCheck.Rows.Count == 0)
		{
			string val = tbCouName.Text.Trim().ToString();
			string sqlInsertOrg = "insert into tb_Course(C_CouName)values('" + val + "')";
			DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
			Response.Write("<script>alert('课程名称添加成功！！');window.location='../Admin/Index.aspx'</script>");
		}
		else if (tbCouName.Text.Trim() == "")
		{
			Response.Write("<script>alert('请填写课程名称！！');window.location='../Admin/Index.aspx'</script>");
		}
		else
		{
			string checkVal = tbCouName.Text.Trim();
			string compareVal = "select * from tb_Course where C_CouName = '" + checkVal + "'";
			//string readVal = DBHelper.DBHelper.ExecuteReader(compareVal).ToString();
			if (DBHelper.DBHelper.ExecuteDataTable(compareVal).Rows.Count > 0)
			{
				Response.Write("<script>alert('课程名称已存在！！');window.location='../Admin/Index.aspx'</script>");
			}
			else
			{
				string val = tbCouName.Text.Trim().ToString();
				string sqlInsertOrg = "insert into tb_Course(C_CouName)values('" + val + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
				Response.Write("<script>alert('课程名称添加成功！！');window.location='../Admin/Index.aspx'</script>");
			}
		}
	}

	public void BindCourse()
	{
		string dataSearch = "select * from tb_Course";
		gvCourse.DataSource = DBHelper.DBHelper.ExecuteDataTable(dataSearch);
		gvCourse.DataKeyNames = new string[] { "C_CouID" };
		gvCourse.DataBind();
	}

	protected void gvCourse_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvCourse.PageIndex) * gvCourse.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}

		//如果是绑定数据行 
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
			{
				((LinkButton)e.Row.Cells[3].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}

	protected void gvCourse_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvCourse.EditIndex = e.NewEditIndex;
		BindCourse();
	}

	protected void gvCourse_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvCourse.EditIndex = -1;
		BindCourse();
	}

	protected void gvCourse_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_Course where C_CouID='" + gvCourse.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		BindCourse();
	}

	protected void gvCourse_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_Course set C_CouName='"
			+ ((TextBox)(gvCourse.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where C_CouID= '" + gvCourse.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvCourse.EditIndex = -1;
		BindCourse();
	}

	protected void gvCourse_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvCourse.PageIndex = e.NewPageIndex;
		BindCourse();
	}
	#endregion

	#region 课程目录
	protected void btnCourseContent_Click(object sender, EventArgs e)
	{
		string checkNull = "select * from tb_CourseContent";
		DataTable dtCheck = DBHelper.DBHelper.ExecuteDataTable(checkNull);
		if (dtCheck.Rows.Count == 0)
		{
			string val = tbAddCourseContent.Text.Trim().ToString();
			string val1 = ddlCourse.SelectedValue;
			string sqlInsertOrg = "insert into tb_CourseContent(CC_CConName, CC_CouID)values('" + val + "', '" + val1 + "')";
			DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
			Response.Write("<script>alert('目录名称保存成功！！');window.location='../Admin/Index.aspx'</script>");
		}
		else if (tbAddCourseContent.Text.Trim() == "")
		{
			Response.Write("<script>alert('请填写目录名称！！');window.location='../Admin/Index.aspx'</script>");
		}
		else
		{
			int getOrgID = (int)DBHelper.DBHelper.ExecuteScalar("select C_CouID from tb_Course where C_CouName= '" + ddlCourse.SelectedItem.Text.Trim() + "'");
			string checkVal = tbAddCourseContent.Text.Trim().ToString();
			string compareVal1 = "select * from tb_CourseContent where CC_CConName = '" + checkVal + "' and CC_CouID = '" + getOrgID + "'";
			//string compareVal2 = "select * from tb_Department a, tb_OrgContent b where a.D_OrgID=b.O_OrgID= '" + getOrgID + "'";
			//string readVal = DBHelper.DBHelper.ExecuteReader(compareVal).ToString();
			if (DBHelper.DBHelper.ExecuteDataTable(compareVal1).Rows.Count > 0)
			{
				Response.Write("<script>alert('目录名称已存在！！');window.location='../Admin/Index.aspx'</script>");
			}
			else
			{
				string val = tbAddCourseContent.Text.Trim().ToString();
				string val1 = ddlCourse.SelectedValue;
				string sqlInsertOrg = "insert into tb_CourseContent(CC_CConName, CC_CouID)values('" + val + "', '" + val1 + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
				Response.Write("<script>alert('目录名称保存成功！！');window.location='../Admin/Index.aspx'</script>");
			}
		}
	}

	public void BindCourseContent()
	{
		string dataSearch = "select * from tb_CourseContent a, tb_Course b where a.CC_CouID=b.C_CouID";
		gvCourseContent.DataSource = DBHelper.DBHelper.ExecuteDataTable(dataSearch);
		gvCourseContent.DataKeyNames = new string[] { "CC_CConID" };
		gvCourseContent.DataBind();
	}

	protected void gvCourseContent_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvCourseContent.PageIndex) * gvCourseContent.PageSize + e.Row.RowIndex + 1;
			e.Row.Cells[0].Text = indexID.ToString();
		}

		//如果是绑定数据行 
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
			{
				((LinkButton)e.Row.Cells[4].Controls[0]).Attributes.Add("onclick", "javascript:return confirm('你确认要删除：\"" + e.Row.Cells[1].Text + "\"吗?')");
			}
		}
	}

	protected void gvCourseContent_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvCourseContent.EditIndex = e.NewEditIndex;
		BindCourseContent();
	}

	protected void gvCourseContent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvCourseContent.EditIndex = -1;
		BindCourseContent();
	}

	protected void gvCourseContent_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_CourseContent where CC_CConID='" + gvCourseContent.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		BindCourseContent();
	}

	protected void gvCourseContent_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_CourseContent set CC_CConName='"
			+ ((TextBox)(gvCourseContent.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where CC_CConID= '" + gvCourseContent.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvCourseContent.EditIndex = -1;
		BindCourseContent();
	}

	protected void gvCourseContent_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvCourseContent.PageIndex = e.NewPageIndex;
		BindCourseContent();
	}
	#endregion
}