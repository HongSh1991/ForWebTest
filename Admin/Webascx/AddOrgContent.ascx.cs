using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Webascx_AddOrgContent : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Bind();
		}
	}

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

	public void Bind()
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
		Bind();
	}

	protected void gvOrgContent_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
	{
		gvOrgContent.EditIndex = -1;
		Bind();
	}

	protected void gvOrgContent_RowDeleting(object sender, GridViewDeleteEventArgs e)
	{
		string deleteRow = "delete from tb_OrgContent where O_OrgID='" + gvOrgContent.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(deleteRow);
		Bind();
	}

	protected void gvOrgContent_RowUpdating(object sender, GridViewUpdateEventArgs e)
	{
		string updateRow = "update tb_OrgContent set O_OrgName='"
			+ ((TextBox)(gvOrgContent.Rows[e.RowIndex].Cells[1].Controls[0])).Text.ToString().Trim() + "' where O_OrgID= '" + gvOrgContent.DataKeys[e.RowIndex].Value.ToString() + "'";
		DBHelper.DBHelper.ExectueNonQuery(updateRow);
		gvOrgContent.EditIndex = -1;
		Bind();
	}

	protected void gvOrgContent_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gvOrgContent.PageIndex = e.NewPageIndex;
		Bind();
	}
}