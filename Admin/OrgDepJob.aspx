<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrgDepJob.aspx.cs" Inherits="Admin_OrgDepJob" %>
<%@ Register Src="~/Admin/Webascx/Header.ascx" TagName="Header" TagPrefix="uc1" %>

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
</head>
<body style="margin: auto; height:100%; overflow-y:hidden">
	<form id="form1" runat="server" class="layui-form-pane">
		<div>
			<uc1:Header ID="Header1" runat="server" />
		</div>
		<div id="main" style="height: 78.2%; overflow-x:hidden; overflow-y:auto;">
			<table style="height: 100%; width: 100%;">
				<tr>
					<td style="height: 24%; width: 100%;">
						<!--机构信息-->
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%; margin-left: 120px; margin-right: 120px">
							<legend>
								>&nbsp;<span style="font-size: 14pt">机构信息管理</span>
							</legend>
						</fieldset>
						<!--新增机构目录-->
						<div class="site-text site-block" style="margin-top: 24px; margin-left: 150px; margin-right: 150px;">
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">机构名称:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbOrgName" runat="server" placeholder="请输入机构名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
								<div align="left">
									<asp:Button ID="btnSaveOrgContent" runat="server" Text="保存机构名称" CssClass="layui-btn" OnClick="btnSaveOrgContent_Click" />
								</div>
							</div>

							<asp:GridView ID="gvOrgContent" runat="server" OnRowEditing="gvOrgContent_RowEditing" OnRowUpdating="gvOrgContent_RowUpdating" OnRowDeleting="gvOrgContent_RowDeleting" OnRowCancelingEdit="gvOrgContent_RowCancelingEdit" OnPageIndexChanging="gvOrgContent_PageIndexChanging" OnRowDataBound="gvOrgContent_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
								<Columns>
									<asp:BoundField DataField="O_OrgID" HeaderText="序号" ItemStyle-Width="32px" />
									<asp:BoundField DataField="O_OrgName" HeaderText="机构名称" />
									<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
									<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
								</Columns>
								<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
								<RowStyle HorizontalAlign="Center" />
							</asp:GridView>
						</div>
					</td>
				</tr>
				<tr>
					<td style="height: 24%; width: 100%;">
						<!--部门信息-->
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%; margin-left: 120px; margin-right: 120px">
							<legend>
								>>&nbsp;<span style="font-size: 14pt">部门信息管理</span>
							</legend>
						</fieldset>
						<!--新增部门-->
						<div class="site-text site-block" style="margin-top: 24px; margin-left: 150px; margin-right: 150px;">
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">部门名称:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbAddDepartment" runat="server" placeholder="请输入部门名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
								<label class="layui-form-label" style="text-align: right">所属机构:</label>
								<div class="layui-input-inline">
									<asp:DropDownList ID="ddlBOrgContent" runat="server" placeholder="请选择机构名称" CssClass="ddl">
									</asp:DropDownList>
								</div>
								<div align="left">
									<asp:Button ID="btnSaveDe" runat="server" Text="保存部门信息" CssClass="layui-btn" OnClick="btnSaveDe_Click" />
								</div>
							</div>
							<asp:GridView ID="gvDepartment" runat="server" OnRowEditing="gvDepartment_RowEditing" OnRowUpdating="gvDepartment_RowUpdating" OnRowDeleting="gvDepartment_RowDeleting" OnRowCancelingEdit="gvDepartment_RowCancelingEdit" OnPageIndexChanging="gvDepartment_PageIndexChanging" OnRowDataBound="gvDepartment_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
								<Columns>
									<asp:BoundField DataField="D_DepID" HeaderText="序号" ItemStyle-Width="32px" />
									<asp:BoundField DataField="D_DepartmentName" HeaderText="部门名称" />
									<asp:BoundField DataField="O_OrgName" HeaderText="机构名称" />
									<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
									<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
								</Columns>
								<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
								<RowStyle HorizontalAlign="Center" />
							</asp:GridView>
						</div>
					</td>
				</tr>
				<tr>
					<td style="height: 24%; width: 100%;">
						<!--岗位信息-->
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%; margin-left: 120px; margin-right: 120px">
							<legend>
								>>>&nbsp;<span style="font-size: 14pt;">岗位信息管理</span>
							</legend>
						</fieldset>
						<!--新增岗位-->
						<div class="site-text site-block" style="margin-top: 24px; margin-left: 150px; margin-right: 150px;">
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">岗位名称:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbAddPost" runat="server" placeholder="请输入岗位名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>

								<label class="layui-form-label" style="text-align: right">所属部门:</label>
								<div class="layui-input-inline">
									<asp:DropDownList ID="ddlBDepartment" runat="server" placeholder="请选择部门名称" CssClass="ddl">
									</asp:DropDownList>
								</div>

								<div align="left">
									<asp:Button ID="btnSaveJob" runat="server" Text="保存岗位信息" CssClass="layui-btn" OnClick="btnSaveJob_Click" />
								</div>
							</div>
							<asp:GridView ID="gvPost" runat="server" OnRowEditing="gvPost_RowEditing" OnRowUpdating="gvPost_RowUpdating" OnRowDeleting="gvPost_RowDeleting" OnRowCancelingEdit="gvPost_RowCancelingEdit" OnPageIndexChanging="gvPost_PageIndexChanging" OnRowDataBound="gvPost_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
								<Columns>
									<asp:BoundField DataField="J_PostID" HeaderText="序号" ItemStyle-Width="32px" />
									<asp:BoundField DataField="J_PostName" HeaderText="岗位名称" />
									<asp:BoundField DataField="D_DepartmentName" HeaderText="部门名称" />
									<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
									<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
								</Columns>
								<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
								<RowStyle HorizontalAlign="Center" />
							</asp:GridView>
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
