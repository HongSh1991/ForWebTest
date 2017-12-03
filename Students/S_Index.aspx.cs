using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Students_S_Index : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if(!IsPostBack)
		{
			Bind();
		}
	}

	protected void Bind()
	{
		if (Session["UserName"] != null)
		{
			string sqlData = "select * from tb_StudentStudy";
			string sqlChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"] + "'";
			string imgPath = "select U_Photo from tb_UserInfo where U_UserName = '" + Session["UserName"] + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(sqlChineseName).ToString();
			imgHead.ImageUrl = DBHelper.DBHelper.ExecuteScalar(imgPath).ToString();
			if (DBHelper.DBHelper.ExecuteDataTable(sqlData).Rows.Count != 0)
			{
				string sqlData1 = "select * from tb_StudentStudy where SS_SStudyUserName = '" + chineseName + "'";
				repeaterUserInfo.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlData1);
				repeaterUserInfo.DataBind();
			}
			string sqlCount = "select SS_SStudyCourseName as 任务名称, COUNT(*) as 次数 FROM tb_StudentStudy where SS_SStudyUserName = '" + chineseName + "' GROUP BY SS_SStudyCourseName";
			repeaterCount.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlCount);
			repeaterCount.DataBind();
		}
		else
		{
			Response.Write("<script>alert('请登录！');window.location='../LoginPages/Login.aspx'</script>");
		}
	}
}