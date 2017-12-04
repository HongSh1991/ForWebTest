using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AddUserInfo : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			Bind();

			fUploadUser.Visible = true;
			btnSaveImg.Visible = true;
		}
	}

	protected void Bind()
	{
		// 绑定部门、岗位
		string departmentName = "select * from tb_Department";
		DataTable dt = DBHelper.DBHelper.ExecuteDataTable(departmentName);
		string postName = "select * from tb_Job";
		DataTable dt1 = DBHelper.DBHelper.ExecuteDataTable(postName);
		if (!((dt.Rows.Count == 0) && (dt1.Rows.Count == 0)))
		{
			string departmentNameBind = "select * from tb_Department";
			ddlAddDepartment.DataSource = DBHelper.DBHelper.ExecuteDataTable(departmentNameBind);
			ddlAddDepartment.DataTextField = "D_DepartmentName";
			ddlAddDepartment.DataValueField = "D_DepID";
			ddlAddDepartment.DataBind();

			ddlAddJob.Items.Clear();
			string postNameBind = "select * from tb_Job where J_DepID = '" + ddlAddDepartment.SelectedValue + "'";
			ddlAddJob.DataSource = DBHelper.DBHelper.ExecuteDataTable(postNameBind);
			ddlAddJob.DataTextField = "J_PostName";
			ddlAddJob.DataValueField = "J_PostID";
			ddlAddJob.DataBind();
		}
	}

	protected void ddlAddDepartment_SelectedIndexChanged(object sender, EventArgs e)
	{
		string DepID = ddlAddDepartment.SelectedValue.Trim();
		if (!string.IsNullOrEmpty(DepID))
		{
			ddlAddJob.Items.Clear();
			string jobSeachDepID = "select * from tb_Job where J_DepID = '" + DepID + "'";
			ddlAddJob.DataSource = DBHelper.DBHelper.ExecuteDataTable(jobSeachDepID);
			ddlAddJob.DataTextField = "J_PostName";
			ddlAddJob.DataValueField = "J_PostID";
			ddlAddJob.DataBind();
		}
	}

	protected void btnSaveImg_Click(object sender, EventArgs e)
	{
		if (fUploadUser.PostedFile.FileName == "")
		{
			lbShowTips.Text = "请选择用户头像！";
			return;
		}
		else
		{
			string filePath = fUploadUser.PostedFile.FileName;
			FileInfo fi = new FileInfo(filePath);
			string name = fi.Name;
			string type = fi.Extension;
			string savePath = Server.MapPath("~\\Resources\\UploadFiles\\Images");
			if (type == ".jpg" || type == ".gif" || type == ".bmp" || type == ".png")
			{
				this.fUploadUser.PostedFile.SaveAs(savePath + "\\" + name);
				this.imgUser.Visible = true;
				this.imgUser.ImageUrl = "~\\Resources\\UploadFiles\\Images" + "\\" + name;
				lbShowTips.Text = "上传成功！";
				fUploadUser.Visible = false;
				btnSaveImg.Visible = false;
			}
			else
			{
				lbShowTips.Text = "请选择正确的格式！！！";
			}
		}
	}

	protected void btnSaveAdd_Click(object sender, EventArgs e)
	{
		string userName = tbAddUserName.Text.Trim();
		string passWord = tbAddPassWord.Text.Trim();
		string chineseName = tbAddChineseName.Text.Trim();
		string sex = rblSex.SelectedItem.Text.Trim();
		string role = rblRole.SelectedItem.Text.Trim();
		string education = rblEducation.SelectedItem.Text.Trim();
		//在首页展示的时候合并成部门 2017-11-27添加depid
		string departmentName = ddlAddDepartment.SelectedItem.Text.Trim();
		int depID = Convert.ToInt32(ddlAddDepartment.SelectedValue);
		string job = ddlAddJob.SelectedItem.Text.Trim();
		string phoneNum = tbAddContact.Text.Trim();
		string datetime = tbAddDatetime.Text.Trim();
		string address = tbAddAdress.Text.Trim();
		string imgPath = imgUser.ImageUrl.Trim().ToString();

		string sqlInsert = "insert into tb_UserInfo(U_UserName, U_PassWord, U_ChineseName, U_Sex, U_Role, U_Education, U_DepartmentName, U_DepID, U_Job, U_PhoneNum, U_EmployTime, U_Address, U_Photo)values('" + userName + "', '" + passWord + "', '" + chineseName + "', '" + sex + "', '" + role + "', '" + education + "', '" + departmentName + "', '" + depID + "', '" + job + "', '" + phoneNum + "', '" + datetime + "', '" + address + "', '" + imgPath + "')";
		DBHelper.DBHelper.ExectueNonQuery(sqlInsert);
		Response.Write("<script>alert('人员添加成功！');window.location=''</script>");
	}
}