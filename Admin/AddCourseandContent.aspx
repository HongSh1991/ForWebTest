<%@ Page Language="c#" AutoEventWireup="true" CodeFile="AddCourseandContent.aspx.cs" Inherits="Admin_AddCourseandContent" %>
<%@ Register Src="~/Admin/Webascx/Header.ascx" TagName="Header" TagPrefix="uc1" %>

<!doctype html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
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
<body style="margin: auto; overflow-y:hidden">
	<form id="form1" runat="server"  class="layui-form-pane" >
		<div style="height: 28%;">
			<uc1:Header ID="Header1" runat="server" />
		</div>

		<div id="main" style="height: 78.2%; overflow-x:hidden; overflow-y:auto;">
			<table style="height: 100%; width: 100%;">
				<tr>
					<td>
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%; margin-left: 120px; margin-right: 120px">
							<legend>
								<span style="font-size: 14pt">课程名称管理</span>
							</legend>
						</fieldset>
						<!--新增课程目录-->
						<div class="site-text site-block" style="margin-top: 24px; margin-left: 150px; margin-right: 150px">
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">课程名称:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbCouName" runat="server" placeholder="请输入课程名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
								<div align="left">
									<asp:Button ID="btnSaveCourse" runat="server" Text="保存课程名称" CssClass="layui-btn" OnClick="btnSaveCourse_Click" />
								</div>
							</div>

							<asp:GridView ID="gvCourse" runat="server" OnRowEditing="gvCourse_RowEditing" OnRowUpdating="gvCourse_RowUpdating" OnRowDeleting="gvCourse_RowDeleting" OnRowCancelingEdit="gvCourse_RowCancelingEdit" OnPageIndexChanging="gvCourse_PageIndexChanging" OnRowDataBound="gvCourse_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
								<Columns>
									<asp:BoundField DataField="C_CouID" HeaderText="序号" ItemStyle-Width="32px" />
									<asp:BoundField DataField="C_CouName" HeaderText="课程名称" />
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
					<td>
						<fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%; margin-left: 120px; margin-right: 120px">
							<legend>
								<span style="font-size: 14pt">课程目录管理</span>
							</legend>
						</fieldset>
						<!--新增课程-->
						<div class="site-text site-block" style="margin-top: 24px; margin-left: 150px; margin-right: 150px">
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">目录名称:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbAddCourseContent" runat="server" placeholder="请输入目录名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
								<label class="layui-form-label" style="text-align: right">所属课程:</label>
								<div class="layui-input-inline">
									<asp:DropDownList ID="ddlCourse" runat="server" placeholder="请选择课程名称" CssClass="ddl">
									</asp:DropDownList>
								</div>
								<div align="left">
									<asp:Button ID="btnCourseContent" runat="server" Text="保存课程目录" CssClass="layui-btn" OnClick="btnCourseContent_Click" />
								</div>
							</div>
							<asp:GridView ID="gvCourseContent" runat="server" OnRowEditing="gvCourseContent_RowEditing" OnRowUpdating="gvCourseContent_RowUpdating" OnRowDeleting="gvCourseContent_RowDeleting" OnRowCancelingEdit="gvCourseContent_RowCancelingEdit" OnPageIndexChanging="gvCourseContent_PageIndexChanging" OnRowDataBound="gvCourseContent_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
								<Columns>
									<asp:BoundField DataField="CC_CConID" HeaderText="序号" ItemStyle-Width="32px" />
									<asp:BoundField DataField="CC_CConName" HeaderText="目录名称" />
									<asp:BoundField DataField="C_CouName" HeaderText="课程名称" />
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
