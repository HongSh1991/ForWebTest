<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddCourseFiles.aspx.cs" Inherits="Admin_AddCourseFiles" %>
<%@ Register Src="~/Admin/Webascx/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
	<title style="text-align: center">管理员，欢迎您！</title>
	<script src="../../Resources/Admin/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../layui/css/layui.css" />
	<link rel="stylesheet" href="../StyleSheet.css" type="text/css" />

	<style type="text/css">
		.button {
			cursor: pointer;
			border-radius: 6px;
		}

		.button1 {
			cursor: pointer;
		}

		.button2 {
			width: 72px;
		}

		.buttonSearch {
			width: 100%;
			height: 40px;
		}

		* {
			padding: 0;
			margin: 0;
			border: none;
		}

		.aside {
			position: absolute;
			/*top: 21.7%;*/
			top: 0%;
			/*left: 2%;*/
			bottom: 0;
			width: 20%;
			background-color: #eeeeee;
		}

		#main {
			position:absolute;
			height:120%;
			left: 2%;
			/*top: 21.7%;*/
			right: 0%;
			bottom: 0;
			/*overflow: hidden;*/
		}

		#main1 {
			position: absolute;
			left: 8%;
			/*top: 21.7%;*/
			top: 21.7%;
			right: 8%;
			bottom: 0;
			overflow: hidden;
		}

		#main2 {
			position: absolute;
			left: 19%;
			top: 8%;
			/*right: 8%;*/
			bottom: 0;
			overflow: hidden;
		}

		.ddl {
			height: 38px;
			width: 190px;
			cursor: pointer;
			color: gray;
			text-align: center;
			padding-left: 6px;
			border-right: Gainsboro 1px solid;
			border-top: Gainsboro 1px solid;
			border-left: Gainsboro 1px solid;
			border-bottom: Gainsboro 1px solid;
		}

		.linkButtonStyle {
			color: #01AAED;
			text-decoration: none;
		}
	</style>

	<script type="text/javascript">
		$(document).ready(function () {
			$('#btnReadFiles').click(function () {
				$('#<%=fuFiles.ClientID %>').click();
			});

			//修改出现C:\fakepath\,使用internet选项--安全--自定义级别--将文件上载到服务器时包含本地目录路径..--点上启用
			$('#<%=fuFiles.ClientID %>').change(function () {
				$('#<%=tbFilesPath.ClientID %>').val($('#<%=fuFiles.ClientID %>').val());
			});
		});
	</script>
</head>
<body>
	<form id="form1" runat="server" class="layui-form-pane">
		<div style="height: 28%;">
			<uc1:Header ID="Header1" runat="server" />
		</div>
		<div style="height: 56%; overflow-x: hidden; overflow-y: auto;">
			<table style="height: 100%; width: 100%">
				<tr>
					<td>
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%; margin-left:19%; margin-right:19%">
							<legend>
								<span style="font-size: 14pt">新增课程内容</span>
							</legend>
						</fieldset>
						<div id="test4" class="site-text site-block" style="margin-top: 24px; margin-left: 32%;">
							<table style="width: 100%; height: 100%;" align="center">
								<tr>
									<td style="width: 45%">
										<div class="layui-form-item" style="vertical-align: middle">
											<label class="layui-form-label" style="text-align: right; vertical-align: middle">缩略图:</label>
											<div class="layui-input-inline">
												<asp:Image ID="imgFiles" runat="server" Width="400px" Height="300px" />
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<div>
											<table>
												<tr>
													<td style="height: 10px;"></td>
												</tr>
											</table>
										</div>
										<div class="layui-form-item">
											<label class="layui-form-label" style="text-align: right">课件名称:</label>
											<div class="layui-input-block" style="width: 38.4%">
												<asp:TextBox ID="tbCourseFileName" runat="server" placeholder="请输入课件名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<div>
											<table>
												<tr>
													<td style="height: 10px;"></td>
												</tr>
											</table>
										</div>
										<div class="layui-form-item">
											<table style="width: 100%">
												<tr>
													<td style="width: 20%">
														<label class="layui-form-label" style="text-align: right">所属课程:</label>
														<div class="layui-input-block">
															<asp:DropDownList ID="ddlCourse" runat="server" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" AutoPostBack="true" CssClass="ddl"></asp:DropDownList>
														</div>
													</td>
													<td style="width: 0.8%"></td>
													<td align="left">
														<label class="layui-form-label" style="text-align: right">所属目录:</label>
														<div class="layui-input-block">
															<asp:DropDownList ID="ddlContent" runat="server" CssClass="ddl"></asp:DropDownList>
														</div>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3">
										<div>
											<table>
												<tr>
													<td style="height: 10px;"></td>
												</tr>
											</table>
										</div>
										<div class="layui-form-item">
											<table style="width: 100%">
												<tr>
													<td style="width: 32.4%">
														<label class="layui-form-label" style="text-align: right">上传文件:</label>
														<div class="layui-input-block" style="width: 100%">
															<asp:FileUpload ID="fuFiles" runat="server" />
															<asp:TextBox ID="tbFilesPath" runat="server" autocomplete="off" CssClass="layui-input"></asp:TextBox>
														</div>
													</td>
													<td style="width: 0.2%"></td>
													<td style="width: 67.4%; vertical-align: middle">
														<div class="layui-input-block" style="margin-bottom: 2px;">
															<input id="btnReadFiles" type="button" value="浏览..." class="layui-btn button4" />
														</div>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
							<div>
								<table>
									<tr>
										<td style="height: 40px;"></td>
									</tr>
								</table>
							</div>
							<div style="margin-left: 20%">
								<table>
									<tr>
										<td>
											<asp:Button ID="btnSaveCourseFiles" runat="server" Text="保存课件" CssClass="layui-btn" OnClick="btnSaveCourseFiles_Click" />
										</td>
										<td style="width: 4%"></td>
										<td>
											<input type="reset" class="layui-btn button3" />
										</td>
									</tr>
									<tr>
										<asp:Label ID="lbShowTips" runat="server" Text=""></asp:Label>
									</tr>
								</table>
							</div>
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
