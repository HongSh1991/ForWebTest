using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_OrgDepJob : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			//绑定机构
			BindOrg();

			//绑定部门
			//绑定数据至DDL
			string orgName = "select * from tb_OrgContent";
			ddlBOrgContent.DataSource = DBHelper.DBHelper.ExecuteDataTable(orgName);
			ddlBOrgContent.DataTextField = "O_OrgName";
			ddlBOrgContent.DataValueField = "O_OrgID";
			ddlBOrgContent.DataBind();

			BindDep();

			//绑定岗位
			string departmentName = "select * from tb_Department";
			ddlBDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(departmentName);
			ddlBDepartment.DataTextField = "D_DepartmentName";
			ddlBDepartment.DataValueField = "D_DepID";
			ddlBDepartment.DataBind();


		}
	}

	#region 机构信息
	protected void btnSaveOrgContent_Click(object sender, EventArgs e)
	{
		string checkNull = "select * from tb_OrgContent";
		DataTable dtCheck = DBHelper.DBHelper.ExecuteDataTable(checkNull);
		if (dtCheck.Rows.Count == 0)
		{
			string val = tbOrgName.Text.Trim().ToString();
			string sqlInsertOrg = "insert into tb_OrgContent(O_OrgName)values('" + val + "')";
			DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
			Response.Write("<script>alert('机构名称添加成功！！');window.location='../Admin/Index.aspx'</script>");
		}
		else if (tbOrgName.Text.Trim() == "")
		{
			Response.Write("<script>alert('请填写机构名称！！');window.location='../Admin/Index.aspx'</script>");
		}
		else
		{
			string checkVal = tbOrgName.Text.Trim();
			string compareVal = "select * from tb_OrgContent where O_OrgName = '" + checkVal + "'";
			//string readVal = DBHelper.DBHelper.ExecuteReader(compareVal).ToString();
			if (DBHelper.DBHelper.ExecuteDataTable(compareVal).Rows.Count > 0)
			{
				Response.Write("<script>alert('机构名称已存在！！');window.location='../Admin/Index.aspx'</script>");
			}
			else
			{
				string val = tbOrgName.Text.Trim().ToString();
				string sqlInsertOrg = "insert into tb_OrgContent(O_OrgName)values('" + val + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
				Response.Write("<script>alert('机构名称添加成功！！');window.location='../Admin/Index.aspx'</script>");
			}
		}
	}

	public void BindOrg()
	{
		string dataSearch = "select * from tb_OrgContent";
		gvOrgContent.DataSource = DBHelper.DBHelper.ExecuteDataTable(dataSearch);
		gvOrgContent.DataKeyNames = new string[] { "O_OrgID" };
		gvOrgContent.DataBind();
	}

	protected void gvOrgContent_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvOrgContent.PageIndex) * gvOrgContent.PageSize + e.Row.RowIndex + 1;
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

	protected void gvOrgContent_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvOrgContent.EditIndex = e.NewEditIndex;
		BindOrg();
	}

	protected void gvOrgContent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvOrgContent.EditIndex = -1;
		BindOrg();
	}

	protected void gvOrgContent_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_OrgContent where O_OrgID='" + gvOrgContent.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		BindOrg();
	}

	protected void gvOrgContent_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_OrgContent set O_OrgName='"
			+ ((TextBox)(gvOrgContent.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where O_OrgID= '" + gvOrgContent.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvOrgContent.EditIndex = -1;
		BindOrg();
	}

	protected void gvOrgContent_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvOrgContent.PageIndex = e.NewPageIndex;
		BindOrg();
	}
	#endregion

	#region 部门信息
	protected void btnSaveDe_Click(object sender, EventArgs e)
	{
		string checkNull = "select * from tb_Department";
		DataTable dtCheck = DBHelper.DBHelper.ExecuteDataTable(checkNull);
		if (dtCheck.Rows.Count == 0)
		{
			string val = tbAddDepartment.Text.Trim().ToString();
			string val1 = ddlBOrgContent.SelectedValue;
			string sqlInsertOrg = "insert into tb_Department(D_DepartmentName, D_OrgID)values('" + val + "', '" + val1 + "')";
			DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
			Response.Write("<script>alert('部门名称保存成功！！');window.location='../Admin/Index.aspx'</script>");
		}
		else if (tbAddDepartment.Text.Trim() == "")
		{
			Response.Write("<script>alert('请填写部门名称！！');window.location='../Admin/Index.aspx'</script>");
		}
		else
		{
			int getOrgID = (int)DBHelper.DBHelper.ExecuteScalar("select O_OrgID from tb_OrgContent where O_OrgName= '" + ddlBOrgContent.SelectedItem.Text.Trim() + "'");
			string checkVal = tbAddDepartment.Text.Trim().ToString();
			string compareVal1 = "select * from tb_Department where D_DepartmentName = '" + checkVal + "' and D_OrgID = '" + getOrgID + "'";
			//string compareVal2 = "select * from tb_Department a, tb_OrgContent b where a.D_OrgID=b.O_OrgID= '" + getOrgID + "'";
			//string readVal = DBHelper.DBHelper.ExecuteReader(compareVal).ToString();
			if (DBHelper.DBHelper.ExecuteDataTable(compareVal1).Rows.Count > 0)
			{
				Response.Write("<script>alert('部门名称已存在！！');window.location='../Admin/Index.aspx'</script>");
			}
			else
			{
				string val = tbAddDepartment.Text.Trim().ToString();
				string val1 = ddlBOrgContent.SelectedValue;
				string sqlInsertOrg = "insert into tb_Department(D_DepartmentName, D_OrgID)values('" + val + "', '" + val1 + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsertOrg);
				Response.Write("<script>alert('部门名称保存成功！！');window.location='../Admin/Index.aspx'</script>");
			}
		}
	}

	public void BindDep()
	{
		string dataSearch = "select * from tb_Department a, tb_OrgContent b where a.D_OrgID=b.O_OrgID";
		gvDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(dataSearch);
		gvDepartment.DataKeyNames = new string[] { "D_DepID" };
		gvDepartment.DataBind();
	}

	protected void gvDepartment_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvDepartment.PageIndex) * gvDepartment.PageSize + e.Row.RowIndex + 1;
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

	protected void gvDepartment_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvDepartment.EditIndex = e.NewEditIndex;
		BindDep();
	}

	protected void gvDepartment_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvDepartment.EditIndex = -1;
		BindDep();
	}

	protected void gvDepartment_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_Department where D_DepID='" + gvDepartment.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		BindDep();
	}

	protected void gvDepartment_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_Department set D_DepartmentName='"
			+ ((TextBox)(gvDepartment.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where D_DepID= '" + gvDepartment.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvDepartment.EditIndex = -1;
		BindDep();
	}

	protected void gvDepartment_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvDepartment.PageIndex = e.NewPageIndex;
		BindDep();
	}
	#endregion

	#region 岗位信息
	protected void btnSaveJob_Click(object sender, EventArgs e)
	{
		string checkNull = "select * from tb_Job";
		DataTable dt = DBHelper.DBHelper.ExecuteDataTable(checkNull);
		if (dt.Rows.Count == 0)
		{
			string postName = tbAddPost.Text.Trim().ToString();
			string ddlDepartment = ddlBDepartment.SelectedValue;
			string sqlInsertPost = "insert into tb_Job (J_PostName, J_DepID)values('" + postName + "', '" + ddlDepartment + "')";
			DBHelper.DBHelper.ExectueNonQuery(sqlInsertPost);
			Response.Write("<script>alert('岗位名称保存成功！');window.location=''</script>");
		}
		else if (tbAddPost.Text.Trim() == "")
		{
			Response.Write("<script>alert('请填写岗位名称！！');window.location='../Admin/Index.aspx'</script>");
		}
		else
		{
			int getDepID = (int)DBHelper.DBHelper.ExecuteScalar("select D_DepID from tb_Department where D_DepartmentName= '" + ddlBDepartment.SelectedItem.Text.Trim() + "'");
			string checkVal = tbAddPost.Text.Trim().ToString();
			string compareVal1 = "select * from tb_Job where J_PostName = '" + checkVal + "' and J_DepID = '" + getDepID + "'";
			//string compareVal2 = "select * from tb_Job a, tb_Department b where a.J_DepID=b.D_DepID '" + getDepID + "'";
			//string readVal = DBHelper.DBHelper.ExecuteReader(compareVal).ToString();
			if (DBHelper.DBHelper.ExecuteDataTable(compareVal1).Rows.Count > 0)
			{
				Response.Write("<script>alert('岗位名称已存在！！');window.location='../Admin/Index.aspx'</script>");
			}
			else
			{
				string postName = tbAddPost.Text.Trim().ToString();
				string ddlDepartment = ddlBDepartment.SelectedValue;
				string sqlInsertPost = "insert into tb_Job (J_PostName, J_DepID)values('" + postName + "', '" + ddlDepartment + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsertPost);
				Response.Write("<script>alert('岗位名称保存成功！');window.location=''</script>");
			}
		}
	}

	public void BindJob()
	{
		string postSearch = "select * from tb_Job a, tb_Department b where a.J_DepID=b.D_DepID";
		gvPost.DataSource = DBHelper.DBHelper.ExecuteDataTable(postSearch);
		gvPost.DataKeyNames = new string[] { "J_PostID" };
		gvPost.DataBind();
	}

	protected void gvPost_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowIndex != -1)
		{
			//e.Row.Cells[0].Text = (e.Row.RowIndex + 1).ToString();

			//如果使用了分页控件且希望序号在翻页后不重新计算，使用下面方法  
			int indexID = (gvPost.PageIndex) * gvPost.PageSize + e.Row.RowIndex + 1;
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

	protected void gvPost_RowEditing(object sender, GridViewEditEventArgs e)
	{
		gvPost.EditIndex = e.NewEditIndex;
		BindJob();
	}

	protected void gvPost_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_Job set J_PostName='"
			+ ((TextBox)(gvPost.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where J_PostID= '" + gvPost.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvPost.EditIndex = -1;
		BindJob();
	}

	protected void gvPost_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_Job where J_PostID='" + gvPost.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		BindJob();
	}

	protected void gvPost_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvPost.EditIndex = -1;
		BindJob();
	}

	protected void gvPost_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvPost.PageIndex = e.NewPageIndex;
		BindJob();
	}
	#endregion
}