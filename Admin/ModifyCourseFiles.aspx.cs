﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ModifyCourseFiles : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			this.fuFiles.Style.Add("display", "none");
			//this.fuFiles.Attributes.Add("onchange", "document.getElementById('" + tbFilesPath.ClientID + "').value = this.value");

			Bind();

			BindRequest();
		}
	}

	protected void BindRequest()
	{
		string getID = Request.QueryString["id"].ToString();
		if (getID != null)
		{
			string searchOrigin = "select * from tb_CourseFiles where CF_CFileID = " + Convert.ToInt32(getID);
			DataRowView rv = DBHelper.DBHelper.ExecuteDataTable(searchOrigin).DefaultView[0];
			tbCourseFileName.Text = rv["CF_CFileName"].ToString();

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
		//从主页面传过来的id值
		string getID = Request.QueryString["id"].ToString();

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
				string fileExtension = filePath.Substring(filePath.LastIndexOf(".") + 1);
				string courseFilePath = Server.MapPath("~\\Resources\\UploadFiles\\CourseFiles") + "\\" + fileName;
				string courseFileIconPath1 = "~\\Resources\\Admin\\images\\word.png";
				string courseFileIconPath2 = "~\\Resources\\Admin\\images\\ppt.png";
				string courseFileIconPath3 = "~\\Resources\\Admin\\images\\excel.png";
				string courseFileIconPath4 = "~\\Resources\\Admin\\images\\PDF.png";
				this.fuFiles.PostedFile.SaveAs(courseFilePath);

				if (fileExtension == "doc" || fileExtension == "docx" || fileExtension == "docm")
				{
					string sqlInsert = "update tb_CourseFiles set CF_CFileIcon='" + courseFileIconPath1 + "', CF_CFileName='" + courseFileName + "', CF_CFileContent='" + contentBelongs + "', CF_CFilePath='" + courseFilePath + "' where CF_CFileID='" + getID + "'";
					DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
					Response.Write("<script>alert('课件更新成功！');window.location='ShowTask.aspx'</script>");//window.location='../Admin/Index.aspx'
				}
				else if (fileExtension == "ppt" || fileExtension == "pptx" || fileExtension == "pptm")
				{
					string sqlInsert = "update tb_CourseFiles set CF_CFileIcon='" + courseFileIconPath2 + "', CF_CFileName='" + courseFileName + "', CF_CFileContent='" + contentBelongs + "', CF_CFilePath='" + courseFilePath + "' where CF_CFileID='" + getID + "'";
					DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
					Response.Write("<script>alert('课件更新成功！');window.location='ShowTask.aspx'</script>");
				}
				else if (fileExtension == "xls" || fileExtension == "xlsx" || fileExtension == "xlsm" || fileExtension == "csv")
				{
					string sqlInsert = "update tb_CourseFiles set CF_CFileIcon='" + courseFileIconPath3 + "', CF_CFileName='" + courseFileName + "', CF_CFileContent='" + contentBelongs + "', CF_CFilePath='" + courseFilePath + "' where CF_CFileID='" + getID + "'";
					DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
					Response.Write("<script>alert('课件更新成功！');window.location='ShowTask.aspx'</script>");
				}
				else if (fileExtension == "pdf")
				{
					string sqlInsert = "update tb_CourseFiles set CF_CFileIcon='" + courseFileIconPath4 + "', CF_CFileName='" + courseFileName + "', CF_CFileContent='" + contentBelongs + "', CF_CFilePath='" + courseFilePath + "' where CF_CFileID='" + getID + "'";
					DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
					Response.Write("<script>alert('课件更新成功！');window.location='ShowTask.aspx'</script>");
				}
			}
		}
		catch (Exception error)
		{
			lbShowTips.Text = "处理发生错误！原因： " + error.ToString();
		}
	}
}