<%@ Page Language="C#" AutoEventWireup="true" CodeFile="T_Index.aspx.cs" Inherits="Teachers_T_Index" %>
<%@ Register Src="~/Teachers/T_Header.ascx" TagName="T_Header" TagPrefix="uc1" %>
<%@ Register Src="~/Teachers/CountTask.ascx" TagName="CountTask" TagPrefix="uc2" %>
<%@ Register Src="~/Teachers/CountUser.ascx" TagName="CountUser" TagPrefix="uc3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
	<title></title>
	<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../layui/css/layui.css" />
	<link rel="stylesheet" href="../Resources/Teacher/css/cssSty.css" />
	<link rel="stylesheet" href="../StyleSheet.css" type="text/css" />
</head>
<body>
	<form id="form1" runat="server" class="layui-form-pane">
		<div>
			<uc1:T_Header ID="T_Header1" runat="server" />
		</div>
		<div style="height: 56%;">
			<table style="height: 100%; width: 100%">
				<tr>
					<td align="center">
						<div style="width: 96%; margin-top: 32px;">
							<table style="width: 100%">
								<tr>
									<td style="width: 100%; height: 10%" colspan="3" align="center">
										<span style="font-family: 华文新魏; font-size: 3.2em; font-weight: 600; text-align:center; color:#01AAED">活跃度统计</span>
										<%--<blockquote class="layui-elem-quote"><span style="font-family: 华文新魏; font-size: 2.4em; font-weight: 600">活跃度统计</span></blockquote>--%>
										<hr class="layui-bg-blue" style="height:6px" />
									</td>
								</tr>
								<tr>
									<td style="width: 49%; height:90%">
										<uc2:CountTask ID="CountTask" runat="server" />
									</td>
									<td style="width: 2%"></td>
									<td style="width: 49%; height:90%">
										<uc3:CountUser ID="CountUser" runat="server" />
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</form>

	<script src="../layui/layui.js"></script>
	<script>
		layui.use(['layer', 'form', 'element', 'laydate'], function () {
			var layer = layui.layer,
				form = layui.form,
				element = layui.element,
				laydate = layui.laydate;

			laydate.render({
				elem: '#tbAddDatetime'
			});
		});
	</script>
</body>
</html>
