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
			string sqlCount = "select SS_SStudyCourseName as 任务名称, COUNT(*) as 次数, AVG(SS_SStudyComDegree)as 平均任务完成度 FROM tb_StudentStudy where SS_SStudyUserName = '" + chineseName + "' GROUP BY SS_SStudyCourseName";
			repeaterCount.DataSource = DBHelper.DBHelper.ExecuteDataTable(sqlCount);
			repeaterCount.DataBind();
		}
		else
		{
			Response.Write("<script>alert('请登录！');window.location='../LoginPages/Login.aspx'</script>");
		}
	}

	protected void btnTaskName_Click(object sender, EventArgs e)
	{
		if (Session["UserName"] != null)
		{
			string sqlChineseName = "select U_ChineseName from tb_UserInfo where U_UserName = '" + Session["UserName"] + "'";
			string chineseName = DBHelper.DBHelper.ExecuteScalar(sqlChineseName).ToString();
			string textVal = ((Button)sender).Text.ToString();
			if (textVal != null)
			{
				string sql = "select top 10* from tb_StudentStudy where SS_SStudyUserName = '" + chineseName + "' and SS_SStudyCourseName = '" + textVal + "' order by SS_SStudyDate desc ";
				chartScore.DataSource = DBHelper.DBHelper.ExecuteDataTable(sql);
				chartScore.Series["Series1"].YValueMembers = "SS_SStudyScore";
				chartScore.Series["Series1"].XAxisType = System.Web.UI.DataVisualization.Charting.AxisType.Primary;
				chartScore.Series["Series1"].YAxisType = System.Web.UI.DataVisualization.Charting.AxisType.Primary;
				chartScore.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
				chartScore.ChartAreas["ChartArea1"].Area3DStyle.LightStyle = System.Web.UI.DataVisualization.Charting.LightStyle.Realistic;
				chartScore.ChartAreas["ChartArea1"].AxisX.Interval = 1;
				chartScore.ChartAreas["ChartArea1"].AxisX.IsStartedFromZero = false;
				chartScore.ChartAreas["ChartArea1"].AxisX.ArrowStyle = System.Web.UI.DataVisualization.Charting.AxisArrowStyle.Triangle;
				chartScore.ChartAreas["ChartArea1"].AxisX.IntervalType = System.Web.UI.DataVisualization.Charting.DateTimeIntervalType.Auto;
				chartScore.ChartAreas["ChartArea1"].ShadowColor = System.Drawing.Color.Black;
				chartScore.ChartAreas["ChartArea1"].AxisY.Interval = 20;
				chartScore.ChartAreas["ChartArea1"].AxisY.ArrowStyle = System.Web.UI.DataVisualization.Charting.AxisArrowStyle.Triangle;
				chartScore.ChartAreas["ChartArea1"].AxisY.IntervalType = System.Web.UI.DataVisualization.Charting.DateTimeIntervalType.Auto;
			}
		}
		else
		{
			Response.Write("<script>alert('请登录！');window.location='../LoginPages/Login.aspx'</script>");
		}
	}
}