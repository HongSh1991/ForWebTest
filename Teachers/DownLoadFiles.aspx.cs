using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Teachers_DownLoadFiles : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			if (Request.QueryString["CF_CFileID"] != null)
			{
				string fileFullName;
				string fileID = Request.QueryString["CF_CFileID"].ToString();//取出文件的ID号
				string selectData = "select CF_CFilePath from tb_CourseFiles where CF_CFileID=" + fileID;
				fileFullName = DBHelper.DBHelper.ExecuteScalar(selectData).ToString();//取出文件下载路径
				//fileFullName = Server.MapPath(fileFullName);//将虚拟路径转化为物理路径
				DownloadFile(fileFullName);//下载文件
			}
		}
	}

	//在模态窗口中下载文件
	private void DownloadFile(string fileName)
	{
		System.IO.Stream iStream = null;
		byte[] buffer = new Byte[10000];
		int length;
		long dataToRead;
		string filePath = fileName;
		string filename = System.IO.Path.GetFileName(filePath);
		try
		{
			iStream = new System.IO.FileStream(filePath, System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.Read);
			dataToRead = iStream.Length;
			Response.ContentType = "application/msword";
			Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
			while (dataToRead > 0)
			{
				if (Response.IsClientConnected)
				{
					length = iStream.Read(buffer, 0, 10000);
					Response.OutputStream.Write(buffer, 0, 10000);
					Response.Flush();
					buffer = new Byte[10000];
					dataToRead = dataToRead - length;
				}
				else
				{
					dataToRead = -1;
				}
			}
		}
		catch (Exception ex)
		{
			Response.Write("Error:" + ex.Message);
		}
		finally
		{
			if (iStream != null)
			{
				iStream.Close();
			}
		}
	}
}