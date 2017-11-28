<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Header.ascx.cs" Inherits="Admin_Webascx_Header" %>

<div style="width: 100%; height: 28%; margin: auto; background-color: black">
	<table style="width: 100%; height: 100%;">
		<tr style="height: 8%">
			<td style="width: 2%"></td>
			<td style="width: 96%; height: 38px; vertical-align: middle;" align="right" vertical="middle">
				<asp:LinkButton ID="lbExit" runat="server" OnClick="lbExit_Click">
							<span style="font-family:微软雅黑; vertical-align:middle; font-size:11pt; color:white">退出系统</span>
				</asp:LinkButton>
			</td>
			<td style="width: 2%"></td>
		</tr>

		<tr style="height: 12px; background-color: #70106f">
			<td style="height: 12px;" colspan="3"></td>
		</tr>
		<tr style="height: 60px; background-color: #70106f">
			<td style="width: 2%"></td>
			<td style="width: 96%; text-align: center; vertical-align: middle">
				<span style="font-family: 华文楷体; font-size: 5.6em; font-weight: 600; color: white; text-shadow: 4px 6px 6px #080707">煤矿应急救援培训系统</span>&nbsp;&nbsp;
			</td>
			<td style="width: 2%; vertical-align: bottom;"></td>
		</tr>
		<tr style="height: 12px; background-color: #70106f">
			<td colspan="3"></td>
		</tr>
	</table>
</div>