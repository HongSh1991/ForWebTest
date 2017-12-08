<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="LoginPages_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta name="renderer" content="webkit" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="format-detection" content="telephone=no" />
	<title>用户登录</title>
	<script src="../Resources/Common/js/jquery-3.2.1.min.js" type="text/javascript"></script>
	<script src="../Resources/Common/layui/layui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../layui/css/layui.css"/>
	<link rel="stylesheet" href="../layui/css/global.css" media="all" />
</head>
<body style="background-color:#1E9FFF;"><!--#00CCFF-->
	<table align="center" style="margin-top: 240px">
		<tr>
			<td style="width: 25%"></td>
			<td style="width: 50%">
				<div class="site-title" align="center">
					<table align="center" style="width:100%; margin-right:0px">
							<tr>
								<td style="width:10%"></td>
								<td style="width:79%;">
									<fieldset>
										<legend>
											<span style=" color:white; font-weight:400">用户登录</span>
										</legend>
									</fieldset>
								</td>
								<td style="width:38%"></td>
							</tr>
					</table>
				</div>
				<div class="site-text site-block" style="margin-right:140px">
					<form id="form1" runat="server" class="layui-form layui-form-pane">
						<table align="center" style="width:100%; margin-right:0px;">
							<tr>
								<td style="width:16%"></td>
								<td style="width:46%">
									<div class="layui-form-item">
										<label class="layui-form-label">用户名:</label>
										<div class="layui-input-inline">
											<asp:TextBox ID="tbUserName" runat="server" lay-verify="required" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
										</div>
									</div>
									<div class="layui-form-item">
										<label class="layui-form-label">密&nbsp;&nbsp;&nbsp;&nbsp;码:</label>
										<div class="layui-input-inline">
											<asp:TextBox ID="tbPassWord" TextMode="Password" runat="server" lay-verify="required" placeholder="请输入密码" autocomplete="off" CssClass="layui-input"></asp:TextBox>
										</div>
									</div>
									<div >
										<div align="center">
											<asp:Button ID="btnLogin" runat="server" Text="登&nbsp;&nbsp;&nbsp;&nbsp;录" CssClass="layui-btn layui-btn-primary" OnClick="btnLogin_Click" />&nbsp;&nbsp;
											<asp:Button ID="btnReset" runat="server" Text="重&nbsp;&nbsp;&nbsp;&nbsp;置" CssClass="layui-btn layui-btn-primary" OnClick="btnReset_Click" />
										</div>
									</div>
								</td>
								<td style="width:30%"></td>
							</tr>
						</table>

					</form>
				</div>
			</td>
			<td style="width: 25%"></td>
		</tr>
	</table>


	<script>
		layui.use('form', function () {
			var form = layui.form;
		});
	</script>
</body>
</html>
