using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Teachers_CountTask : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		string searchData = "select * from tb_ChartCourseData";
		SqlDataReader sdr = DBHelper.DBHelper.ExecuteReader(searchData);
		chartPie.DataSource = sdr;
		chartPie.Series["Series1"].XValueMember = "CD_CDataCourseName";
		chartPie.Series["Series1"].YValueMembers = "CD_CDataCourseNameNum";
		//chartPie.Series["Series1"].Points.DataBindXY(sdr, "CD_CDataCourseName", sdr, "CD_CDataCourseNameNum");
		chartPie.Series["Series1"].LegendText = "#VALX:[#PERCENT{P1}]";
		chartPie.Series["Series1"].Label = "#VALX:[#PERCENT{P1}]";
		chartPie.DataBind();
	}
}