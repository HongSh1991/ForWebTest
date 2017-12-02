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
		//string searchData0 = "select * from tb_ChartUserData";
		string searchData1 = "select * from tb_ChartUserData where CU_CUserDataCourseName = '" + selectedVal + "'";
		if (selectedVal != "" || (DBHelper.DBHelper.ExecuteDataTable(searchData1).Rows.Count!= 0))
		{
			chartBar.DataSource = DBHelper.DBHelper.ExecuteReader(searchData1);
			chartBar.Series["Series1"].XValueMember = "CU_CUserDataUserName";
			chartBar.Series["Series1"].YValueMembers = "CU_CUserDataUserNameNum";
			//控制图表内容的
			chartBar.ChartAreas["ChartArea1"].AxisY.Interval = 2;
			chartBar.DataBind();
			//chartBar.DataSource = DBHelper.DBHelper.ExecuteReader(searchData0);
			//chartBar.Series["Series1"].XValueMember = "CU_CUserDataUserName";
			//chartBar.Series["Series1"].YValueMembers = "CU_CUserDataUserNameNum";
			////控制图表内容的
			//chartBar.ChartAreas["ChartArea1"].AxisY.Interval = 2;
			////chartBar.ChartAreas["ChartArea1"].AxisX.Title = "人员名称";
			////chartBar.ChartAreas["ChartArea1"].AxisY.Title = "频率";
			//chartBar.DataBind();
		}
	}
}