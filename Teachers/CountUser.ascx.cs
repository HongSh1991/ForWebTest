using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teachers_CountUser : System.Web.UI.UserControl
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			BindTaskDDL();

			string searchData0 = "select top 30* from tb_ChartUserData order by CU_CUserDataUserNameNum desc";
			chartBar.DataSource = DBHelper.DBHelper.ExecuteReader(searchData0);
			chartBar.Series["Series1"].XValueMember = "CU_CUserDataUserName";
			chartBar.Series["Series1"].YValueMembers = "CU_CUserDataUserNameNum";
			chartBar.Series["Series1"].ToolTip = "#VALY:[#PERCENT{p2}]";//此处的提示是鼠标悬停就提示，不能用LabelToolTip，这个是用在ChartArea里的
			chartBar.Series["Series1"].Label = "#VALY";
			//控制图表内容的
			chartBar.ChartAreas["ChartArea1"].AxisY.Interval = 2;
			chartBar.ChartAreas["ChartArea1"].AxisX.Interval = 1;
			chartBar.ChartAreas["ChartArea1"].ShadowColor = System.Drawing.Color.Black;
			chartBar.ChartAreas["ChartArea1"].ShadowOffset = 4;
			chartBar.ChartAreas["ChartArea1"].AxisX.LabelStyle.Angle = -45;
			chartBar.ChartAreas["ChartArea1"].AxisX.LabelStyle.Font = new System.Drawing.Font(System.Drawing.FontFamily.GenericSansSerif, 10, System.Drawing.FontStyle.Bold);
			chartBar.DataBind();
		}
	}

	protected void BindTaskDDL()
	{
		string getTaskDDL = "select * from tb_ChartCourseData";
		if (DBHelper.DBHelper.ExecuteDataTable(getTaskDDL).Rows.Count != 0)
		{
			ddlSearchTask.DataSource = DBHelper.DBHelper.ExecuteDataTable(getTaskDDL);
			ddlSearchTask.DataTextField = "CD_CDataCourseName";
			ddlSearchTask.DataValueField = "CD_CDataID";
			ddlSearchTask.DataBind();
			ddlSearchTask.Items.Insert(0, new ListItem("---请选择对应任务---", "0"));
		}
	}

	protected void ddlSearchTask_SelectIndexChange(object sender, EventArgs e)
	{
		string selectedVal = ddlSearchTask.SelectedItem.Text.Trim();
		string searchData0 = "select top 30* from tb_ChartUserData order by CU_CUserDataUserNameNum desc";
		string searchData1 = "select * from tb_ChartUserData where CU_CUserDataCourseName = '" + selectedVal + "' order by CU_CUserDataUserNameNum desc ";
		if (selectedVal == "" || (DBHelper.DBHelper.ExecuteDataTable(searchData1).Rows.Count == 0))
		{
			chartBar.DataSource = DBHelper.DBHelper.ExecuteReader(searchData0);
			chartBar.Series["Series1"].XValueMember = "CU_CUserDataUserName";
			chartBar.Series["Series1"].YValueMembers = "CU_CUserDataUserNameNum";
			chartBar.Series["Series1"].ToolTip = "#VALY:[#PERCENT{p2}]";//此处的提示是鼠标悬停就提示，不能用LabelToolTip，这个是用在ChartArea里的
			chartBar.Series["Series1"].Label = "#VALY";
			//控制图表内容的
			chartBar.ChartAreas["ChartArea1"].AxisY.Interval = 2;
			chartBar.ChartAreas["ChartArea1"].AxisX.Interval = 1;
			chartBar.ChartAreas["ChartArea1"].ShadowColor = System.Drawing.Color.Black;
			chartBar.ChartAreas["ChartArea1"].ShadowOffset = 4;
			chartBar.ChartAreas["ChartArea1"].AxisX.LabelStyle.Angle = -45;
			chartBar.ChartAreas["ChartArea1"].AxisX.LabelStyle.Font = new System.Drawing.Font(System.Drawing.FontFamily.GenericSansSerif, 10, System.Drawing.FontStyle.Bold);
			//chartBar.ChartAreas["ChartArea1"].AxisX.Title = "人员名称";
			//chartBar.ChartAreas["ChartArea1"].AxisY.Title = "频率";
			chartBar.DataBind();
		}
		else
		{
			chartBar.DataSource = DBHelper.DBHelper.ExecuteReader(searchData1);
			chartBar.Series["Series1"].XValueMember = "CU_CUserDataUserName";
			chartBar.Series["Series1"].YValueMembers = "CU_CUserDataUserNameNum";
			chartBar.Series["Series1"].ToolTip = "#VALY:[#PERCENT{p2}]";//此处的提示是鼠标悬停就提示，不能用LabelToolTip，这个是用在ChartArea里的
			chartBar.Series["Series1"].Label = "#VALY";
			//控制图表内容的
			chartBar.ChartAreas["ChartArea1"].AxisY.Interval = 2;
			chartBar.ChartAreas["ChartArea1"].AxisX.Interval = 1;
			chartBar.ChartAreas["ChartArea1"].ShadowColor = System.Drawing.Color.Black;
			chartBar.ChartAreas["ChartArea1"].ShadowOffset = 4;
			chartBar.ChartAreas["ChartArea1"].AxisX.LabelStyle.Angle = -45;
			chartBar.ChartAreas["ChartArea1"].AxisX.LabelStyle.Font = new System.Drawing.Font(System.Drawing.FontFamily.GenericSansSerif, 10, System.Drawing.FontStyle.Bold);
			chartBar.DataBind();
		}
	}
}