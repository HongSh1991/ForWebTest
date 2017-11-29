using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Courseascx_AddContent : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			this.fuFiles.Style.Add("display", "none");
			//this.fuFiles.Attributes.Add("onchange", "document.getElementById('" + tbFilesPath.ClientID + "').value = this.value");

			Bind();
		}
	}

	protected void Bind()
	{
		//绑定课程以及课程目录
		string sqlCheckCourse = "select * from tb_Course";
		DataTable dt1 = DBHelper.DBHelper.ExecuteDataTable(sqlCheckCourse);
		string sqlCheckContent = "select * from tb_CourseContent";
		DataTable dt2 = DBHelper.DBHelper.ExecuteDataTable(sqlCheckContent);
		if ((dt1.Rows.Count != 0) && (dt2.Rows.Count != 0))
		{
			string departmentNameBind = "select * from tb_Course";
			ddlCourse.DataSource = DBHelper.DBHelper.ExecuteDataTable(departmentNameBind);
			ddlCourse.DataTextField = "C_CouName";
			ddlCourse.DataValueField = "C_CouID";
			ddlCourse.DataBind();
			ddlCourse.Items.Insert(0, new ListItem("---请选择课程名称---", "0"));

			ddlContent.Items.Clear();
			string postNameBind = "select * from tb_CourseContent where CC_CouID = '" + ddlCourse.SelectedValue + "'";
			ddlContent.DataSource = DBHelper.DBHelper.ExecuteDataTable(postNameBind);
			ddlContent.DataTextField = "CC_CConName";
			ddlContent.DataValueField = "CC_CConID";
			ddlContent.DataBind();
			ddlContent.Items.Insert(0, new ListItem("---请选择目录名称---", "0"));
		}
	}

	protected void ddlCourse_SelectedIndexChanged(object sender, EventArgs e)
	{
		string CouID = ddlCourse.SelectedValue.Trim();
		if (!string.IsNullOrEmpty(CouID))
		{
			ddlContent.Items.Clear();
			string jobSeachDepID = "select * from tb_CourseContent where CC_CouID = '" + CouID + "'";
			ddlContent.DataSource = DBHelper.DBHelper.ExecuteDataTable(jobSeachDepID);
			ddlContent.DataTextField = "CC_CConName";
			ddlContent.DataValueField = "CC_CConID";
			ddlContent.DataBind();
			ddlContent.Items.Insert(0, new ListItem("---请选择目录名称---", "0"));
		}
	}

	protected void btnSaveCourseFiles_Click(object sender, EventArgs e)
	{
		string courseFileName = tbCourseFileName.Text.Trim();
		string contentBelongs = ddlCourse.SelectedItem.Text.Trim() + "_" + ddlContent.SelectedItem.Text.Trim();
		try
		{
			if (fuFiles.PostedFile.FileName == "")
			{
				lbShowTips.Text = "要上传的文件不允许为空！";
				return;
			}
			else
			{
				string filePath = fuFiles.PostedFile.FileName;
				string fileName = filePath.Substring(filePath.LastIndexOf("\\") + 1);
				string courseFilePath = Server.MapPath("~\\Resources\\UploadFiles\\CourseFiles") + "\\" + fileName;
				this.fuFiles.PostedFile.SaveAs(courseFilePath);

				string sqlInsert = "insert into tb_CourseFiles(CF_CFileName, CF_CFileContent, CF_CFilePath)values('" + courseFileName + "', '" + contentBelongs + "', '" + courseFilePath + "')";
				DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
				Response.Write("<script>alert('课件添加成功！');window.location='../Admin/Index.aspx'</script>");
			}
		}
		catch (Exception error)
		{
			lbShowTips.Text = "处理发生错误！原因： " + error.ToString();
		}
	}
}