<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModifyCourseFiles.aspx.cs" Inherits="Admin_ModifyCourseFiles" %>
<%@ Register Src="~/Admin/Webascx/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
	<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../../Resources/Admin/css/mystyle.css" />
	<link rel="stylesheet" href="../layui/css/layui.css" />
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
			<uc1:header id="Header1" runat="server" />
		</div>
		<div style="height: 56%; overflow-x: hidden; overflow-y: auto;">
			<table style="height: 100%; width: 100%">
				<tr>
					<td>
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%; margin-left: 19%; margin-right: 19%">
							<legend>
								<span style="font-size: 14pt">更新课程内容</span>
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
													<td style="width: 30.8%">
														<label class="layui-form-label" style="text-align: right">上传文件:</label>
														<div class="layui-input-block" style="width: 100%">
															<asp:FileUpload ID="fuFiles" runat="server" />
															<asp:TextBox ID="tbFilesPath" runat="server" autocomplete="off" CssClass="layui-input"></asp:TextBox>
														</div>
													</td>
													<td style="width: 0.2%"></td>
													<td style="width: 69%; vertical-align: middle">
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
