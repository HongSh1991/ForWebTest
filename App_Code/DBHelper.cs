using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace DBHelper
{
	public static class DBHelper
	{
		private static readonly string constr = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
		/// <summary>
		/// 执行insert，delete，update的方法
		/// </summary>
		/// <param name="sql">请输入参数1，要执行的sql语句</param>
		/// <param name="pms">sql语句中的参数</param>
		/// <returns></returns>
		public static int ExectueNonQuery(string sql, params SqlParameter[] pms)
		{
			using (SqlConnection con = new SqlConnection(constr))
			{
				using (SqlCommand cmd = new SqlCommand(sql, con))
				{
					if (pms != null)//说明还传了参数
					{
						cmd.Parameters.AddRange(pms);
					}
					con.Open();
					return cmd.ExecuteNonQuery();
				}
			}
		}
		/// <summary>
		/// 执行查询select，返回查询结果中的第一行第一列的数据，是一个数据。这数据可能是int/string /datatime等等所以他的返回值是object
		/// </summary>
		/// <param name="sql">string类型的sql语句，一定是select查询语句</param>
		/// <param name="pms">Sql语句中的SqlParameter类型的参数</param>
		/// <returns></returns>
		public static object ExecuteScalar(string sql, params SqlParameter[] pms)
		{
			using (SqlConnection con = new SqlConnection(constr))
			{
				using (SqlCommand cmd = new SqlCommand(sql, con))
				{
					if (pms != null)//说明还传了参数
					{
						cmd.Parameters.AddRange(pms);
					}
					con.Open();
					return cmd.ExecuteScalar();
				}
			}
		}
		/// <summary>
		/// 当返回dataReader的时候，connection不能关闭，DataReader不能关闭。
		/// 3给command对象一个参数     SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
		/// 这是 在关闭reader的时候就把 connection 关闭了 。
		/// 
		/// </summary>
		/// <param name="sql"></param>
		/// <param name="pms"></param>
		/// <returns></returns>
		public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] pms)
		{
			SqlConnection con = new SqlConnection(constr);//不使用using，不关闭连接
			using (SqlCommand cmd = new SqlCommand(sql, con))
			{
				if (pms != null)//说明还传了参数
				{
					cmd.Parameters.AddRange(pms);
				}
				con.Open();
				SqlDataReader reader = cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);//不使用using ，不关闭dataReader
				return reader;
			}
		}

		public static DataTable ExecuteDataTable(string sql, params SqlParameter[] pms)
		{
			DataTable dt = new DataTable();
			SqlDataAdapter adapter = new SqlDataAdapter(sql, constr);
			if (pms != null)
			{
				adapter.SelectCommand.Parameters.AddRange(pms);
			}
			adapter.Fill(dt);
			return dt;
		}
	}
}