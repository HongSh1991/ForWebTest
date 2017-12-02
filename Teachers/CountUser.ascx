<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CountUser.ascx.cs" Inherits="Teachers_CountUser" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../layui/css/layui.css" />
<link rel="stylesheet" href="../Resources/Teacher/css/cssSty.css" />

<table style="width:100%">
	<tr>
		<td align="right" style="width:100%">
			<div class="layui-form-item" style="height: 32px; margin-left:58%">
				<label class="layui-form-label" style="text-align: right; width:180px;">与人员对应的培训任务:</label>
				<div class="layui-input-inline">
					<asp:DropDownList ID="ddlSearchTask" runat="server" AutoPostBack="True" CssClass="ddl" OnSelectedIndexChanged="ddlSearchTask_SelectIndexChange">
					</asp:DropDownList>
				</div>
			</div>
		</td>
	</tr>
</table>

<div align="center" style="color:#393D49;margin-top:2px">
	<asp:Chart ID="chartBar" runat="server" Height="450px" Width="800px">
		<Titles>
			<asp:Title Name="pieTitle" Text="人员活跃度" Font="Microsoft Sans Serif, 16pt, style=bold" ForeColor="#01AAED"></asp:Title>
		</Titles>
		<Series>
			<asp:Series Name="Series1" IsValueShownAsLabel="True" CustomProperties="MinPixelPointWidth=5, PointWidth=0.75, MaxPixelPointWidth=40" Font="微软雅黑, 11pt"></asp:Series>
		</Series>
		<ChartAreas>
			<asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="True" Area3DStyle-WallWidth="7"></asp:ChartArea>
		</ChartAreas>
	</asp:Chart>
</div>