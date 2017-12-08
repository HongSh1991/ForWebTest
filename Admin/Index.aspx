<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Admin_Index" %>

<%@ Register Src="~/Admin/Webascx/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%--<%@ Register Src="~/Admin/Webascx/AddOrgContent.ascx" TagName="AddOrgContent" TagPrefix="uc2" %>
<%@ Register Src="~/Admin/Webascx/AddDepartment.ascx" TagName="AddDepartment" TagPrefix="uc3" %>
<%@ Register Src="~/Admin/Webascx/AddJob.ascx" TagName="AddJob" TagPrefix="uc4" %>
<%@ Register Src="~/Admin/Webascx/AddUserInfo.ascx" TagName="AddUserInfo" TagPrefix="uc5" %>
<%@ Register Src="~/Admin/Courseascx/AddCourse.ascx" TagName="AddCourse" TagPrefix="uc6" %>
<%@ Register Src="~/Admin/Courseascx/AddContent.ascx" TagName="AddContent" TagPrefix="uc7" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title style="text-align: center">管理员，欢迎您！</title>
	<script src="../../Resources/Admin/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
	<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../layui/css/layui.css" />

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
			position: absolute;
			left: 8%;
			top: 21.7%;
			right: 8%;
			bottom: 0;
			overflow: hidden;
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

	<%--<script type="text/javascript">
		//居中弹窗
		//window.open('ModifyCourseFiles.aspx','','width=640, height=600');
		function openwindow(url, name, iWidth, iHeight) {
			var url;                            //转向网页的地址;
			var name;                           //网页名称，可为空;
			var iWidth;                         //弹出窗口的宽度;
			var iHeight;                        //弹出窗口的高度;
			//window.screen.height获得屏幕的高，window.screen.width获得屏幕的宽
			var iTop = (window.screen.height - 30 - iHeight) / 2;       //获得窗口的垂直位置;
			var iLeft = (window.screen.width - 10 - iWidth) / 2;        //获得窗口的水平位置;
			window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
		}

	</script>--%>

</head>
<body style="margin: auto;">
	<form id="form1" runat="server" class="layui-form-pane">
		<div style="height: 28%;">
			<uc1:Header ID="Header1" runat="server" />
		</div>
		<div style="height: 56%; overflow-x: hidden; overflow-y: auto;">
			<table style="height: 100%; width: 100%">
				<tr>
					<td>
						<div id="main">
							<table style="height: 100%; width: 100%">
								<tr>
									<td style="height: 100%; width: 100%; vertical-align: top">
										<fieldset class="layui-elem-field layui-field-title" style="margin-top: 32px; margin-left: 120px; margin-right: 120px">
											<legend>
												<span style="font-size: 14pt">人员信息管理</span>
											</legend>
										</fieldset>
										<div style="height: 10%; width: 100%; margin-top: 10px; margin-left: 150px; margin-right: 150px">
											<table style="width: 100%; height: 100%">
												<tr>
													<td style="width: 100%">
														<div class="layui-form-item">
															<label class="layui-form-label" style="text-align: right">用户名:</label>
															<div class="layui-input-inline">
																<asp:TextBox ID="tbSearchUserName" runat="server" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
															</div>

															<label class="layui-form-label" style="text-align: right">所属部门:</label>
															<div class="layui-input-inline">
																<asp:DropDownList ID="ddlSearchDepartment" runat="server" placeholder="请选择部门名称" AutoPostBack="True" CssClass="ddl" OnSelectedIndexChanged="ddlSearchDepartment_SelectIndexChange">
																</asp:DropDownList>
															</div>

															<label class="layui-form-label" style="text-align: right">用户角色:</label>
															<div class="layui-input-inline">
																<asp:DropDownList ID="ddlSearchRole" runat="server" placeholder="请选择角色名称" AutoPostBack="True" CssClass="ddl" OnSelectedIndexChanged="ddlSearchRole_SelectIndexChange">
																	<asp:ListItem Text="---请选择角色名称---"></asp:ListItem>
																	<asp:ListItem Text="系统操作员"></asp:ListItem>
																	<asp:ListItem Text="教师"></asp:ListItem>
																	<asp:ListItem Text="普通用户"></asp:ListItem>
																</asp:DropDownList>
															</div>
															<asp:Button ID="btnSearch" runat="server" Text="查询用户" CssClass="layui-btn" OnClick="btnSearch_Click" />
														</div>
													</td>
												</tr>
											</table>
										</div>
										<div style="margin-top: 8px; margin-left: 150px; margin-right: 150px">
											<asp:GridView ID="gvUser" runat="server" OnRowEditing="gvUser_RowEditing" OnRowUpdating="gvUser_RowUpdating" OnRowDeleting="gvUser_RowDeleting" OnRowCancelingEdit="gvUser_RowCancelingEdit" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="15" CssClass="layui-table">
												<Columns>
													<asp:TemplateField HeaderText="序号" ItemStyle-Width="32px">
														<ItemStyle HorizontalAlign="Center" />
														<HeaderStyle HorizontalAlign="Center" Width="32px" />
													</asp:TemplateField>
													<asp:BoundField DataField="U_UserName" HeaderText="用户名" />
													<asp:BoundField DataField="U_ChineseName" HeaderText="姓名" />
													<asp:BoundField DataField="U_Sex" HeaderText="性别" ItemStyle-Width="32px" />
													<asp:BoundField DataField="U_DepartmentName" HeaderText="部门" />
													<asp:BoundField DataField="U_Role" HeaderText="角色" ItemStyle-Width="80px" />
													<asp:BoundField DataField="U_PhoneNum" ItemStyle-Width="100px" HeaderText="电话" />
													<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="100px" ItemStyle-Width="120px" />
													<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="100px" ItemStyle-Width="120px" />
												</Columns>
												<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
												<RowStyle HorizontalAlign="Center" />
											</asp:GridView>
										</div>
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
