<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CountTask.ascx.cs" Inherits="Teachers_CountTask" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../layui/css/layui.css" />
<link rel="stylesheet" href="../Resources/Teacher/css/cssSty.css" />

<div align="center" style="color:#393D49;margin-top:6%;">
	<asp:Chart ID="chartPie" runat="server" Height="450px" Width="800px" ImageType="Jpeg" ChartDashStyle="solid">
		<Titles>
			<asp:Title Name="pieTitle" Text="任务活跃度" Font="Microsoft Sans Serif, 16pt, style=bold" ForeColor="#01AAED"></asp:Title>
		</Titles>
		<Legends>
			<asp:Legend Name="Default" BackColor="Transparent" Font="微软雅黑, 8.25pt," TitleAlignment="Center" ></asp:Legend>
		</Legends> 
		<Series>
			<asp:Series Name="Series1" ChartType="Pie" IsValueShownAsLabel="True" LabelBorderDashStyle="Solid" CustomProperties="PieLabelStyle=Outside" Font="微软雅黑, 9pt"></asp:Series>
		</Series>
		<ChartAreas>
			<asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="True"></asp:ChartArea>
		</ChartAreas>
	</asp:Chart>
</div>