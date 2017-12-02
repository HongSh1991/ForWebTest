<%@ Control Language="C#" AutoEventWireup="true" CodeFile="T_Header.ascx.cs" Inherits="Teachers_T_Header" %>

<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../layui/css/layui.css" />
<link rel="stylesheet" href="../Resources/Teacher/css/cssSty.css" />

<div style="width: 100%; height: 28%; margin: auto; background-color: #1E9FFF">
	<table style="width: 100%; height: 100%;">
		<tr style="height: 8%">
			<td style="width: 2%"></td>
			<td style="width: 96%; height: 24px; vertical-align: middle;" align="right" vertical="middle"></td>
			<td style="width: 2%"></td>
		</tr>

		<tr style="height: 60px; background-color: #1E9FFF">
			<td style="width: 2%"></td>
			<td style="width: 96%; text-align: center; vertical-align: text-top; margin-top:20px">
				<span style="font-family: 华文楷体; font-size: 5.6em; font-weight: 600; color: white; text-shadow: 4px 6px 6px #080707">煤矿应急救援培训系统</span>&nbsp;&nbsp;
			</td>
			<td style="width: 2%; vertical-align: bottom;"></td>
		</tr>
		<tr style="height: 12px; background-color: #1E9FFF">
			<td style="height: 12px;" colspan="3"></td>
		</tr>
		<tr style="height: 26px; background-color: #1E9FFF">
			<td colspan="3"></td>
		</tr>
	</table>
</div>

<ul class="layui-nav layui-bg-cyan">
	<li class="layui-nav-item">
		<asp:Label ID="lbTips" runat="server" Font-Names="华文楷体" Font-Bold="true" ForeColor="white" Font-Size="1.6em"></asp:Label>
	</li>
	<%--<li class="layui-nav-item">
		<asp:LinkButton ID="lbIndex" runat="server" OnClick="lbIndex_Click">教师主页</asp:LinkButton>
	</li>--%>
	<li class="layui-nav-item">
		<asp:LinkButton ID="lbUserManager" runat="server" OnClick="lbUserManager_Click">人员列表</asp:LinkButton>
	</li>
	<li class="layui-nav-item">
		<asp:LinkButton ID="lbCourseManager" runat="server" OnClick="lbCourseManager_Click">资源列表</asp:LinkButton>
	</li>
	<li class="layui-nav-item" align="right">
		<asp:LinkButton ID="lbExit" runat="server" OnClick="lbExit_Click">退出系统
			<%--<span style="font-family:微软雅黑; vertical-align:middle; font-size:11pt; color:white"></span>--%>
		</asp:LinkButton>
	</li>
</ul>