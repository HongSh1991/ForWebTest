<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Admin_Webascx_Header" %>
<script src="../../Resources/Admin/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../layui/css/layui.css" />


<div style="width: 100%; height: 28%; margin: auto; background-color: #1E9FFF">
	<table style="width: 100%; height: 100%;">
		<tr style="height: 8%">
			<td style="width: 2%"></td>
			<td style="width: 96%; height: 24px; vertical-align: middle;" align="right" vertical="middle"></td>
			<td style="width: 2%"></td>
		</tr>

		<tr style="height: 60px; background-color: #1E9FFF"> <!--#70106f-->
			<td style="width: 2%"></td>
			<td style="width: 96%; text-align: center; vertical-align: middle">
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
<ul class="layui-nav layui-bg-cyan" style="width:100%">
	<li class="layui-nav-item">
		<asp:Label ID="lbTips" runat="server" Font-Names="华文楷体" Font-Bold="true" ForeColor="white" Font-Size="1.6em"></asp:Label>
	</li>
	<li class="layui-nav-item">
		<asp:LinkButton ID="lbUserManager" runat="server" OnClick="lbUserManager_Click">人员管理</asp:LinkButton>
		<dl class="layui-nav-child">
			<dd>
				<asp:LinkButton ID="lbDepartInfo" runat="server" OnClick="lbDepartInfo_Click">部门信息管理</asp:LinkButton></dd>
			<dd>
				<asp:LinkButton ID="lbUserInfo" runat="server" OnClick="lbUserInfo_Click">人员信息管理</asp:LinkButton></dd>
		</dl>
	</li>
	<li class="layui-nav-item">
		<asp:LinkButton ID="lbCourseManager" runat="server" OnClick="lbCourseManager_Click">课程管理</asp:LinkButton>
		<dl class="layui-nav-child">
			<!-- 二级菜单 -->
			<dd>
				<asp:LinkButton ID="lbCourseClassify" runat="server" OnClick="lbCourseClassify_Click">课程分类管理</asp:LinkButton></dd>
			<dd>
				<asp:LinkButton ID="lbAddCourses" runat="server" OnClick="lbAddCourses_Click">新增课程内容</asp:LinkButton></dd>
		</dl>
	</li>
	<li class="layui-nav-item">
		<asp:LinkButton ID="lbExit" runat="server" OnClick="lbExit_Click">退出系统</asp:LinkButton>
	</li>
</ul>