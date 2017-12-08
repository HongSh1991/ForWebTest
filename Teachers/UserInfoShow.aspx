<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserInfoShow.aspx.cs" Inherits="Teachers_UserInfoShow" %>

<%@ Register Src="~/Teachers/T_Header.ascx" TagName="T_Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
	<title></title>
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
			top: 21.7%;
			/*top:0;*/
			left: 2%;
			bottom: 0;
			width: 18%;
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
			left: 24%;
			top: 21.7%;
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

		a:link {color:deepskyblue;}    /* 未被访问的链接 */
		a:visited {color:deepskyblue;} /* 已被访问的链接 */
		a:hover {color:#ff6a00;}   /* 鼠标指针移动到链接上 */
		a:active {color:darkorchid;}  /* 正在被点击的链接 */
	</style>
</head>
<body>
	<form id="form1" runat="server" class="layui-form-pane">
		<div>
			<uc1:T_Header ID="T_Header1" runat="server" />
		</div>

		<aside class="aside" style="top:21.7%; width: 18%;">
			<div style="height: 10%; width: 100%; margin-top: 7.1%; margin-left: 6%; margin-right: 150px">
				<table style="width: 100%; height: 100%">
					<tr>
						<td style="width: 100%">
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">用户名:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbSearchUserName" runat="server" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">所属部门:</label>
								<div class="layui-input-inline">
									<asp:DropDownList ID="ddlSearchDepartment" runat="server" placeholder="请选择部门名称" AutoPostBack="True" CssClass="ddl" OnSelectedIndexChanged="ddlSearchDepartment_SelectIndexChange">
									</asp:DropDownList>
								</div>
							</div>
							<%--<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">用户角色:</label>
								<div class="layui-input-inline">
									<asp:DropDownList ID="ddlSearchRole" runat="server" placeholder="请选择角色名称" AutoPostBack="True" CssClass="ddl" OnSelectedIndexChanged="ddlSearchRole_SelectIndexChange">
										<asp:ListItem Text="---请选择角色名称---"></asp:ListItem>
										<asp:ListItem Text="系统操作员"></asp:ListItem>
										<asp:ListItem Text="教师"></asp:ListItem>
										<asp:ListItem Text="普通用户"></asp:ListItem>
									</asp:DropDownList>
								</div>
							</div>--%>
							<div class="layui-form-item" style="margin-right: 13.4%;">
								<asp:Button ID="btnSearch" runat="server" Text="查询用户" CssClass="layui-btn buttonSearch" OnClick="btnSearch_Click" />
							</div>
						</td>
					</tr>
				</table>
			</div>
		</aside>
		<div style="margin-top: 0.6%; margin-left: 21%; margin-right: 60px; width: 76.8%">
			当前位置&nbsp;:&nbsp;<asp:SiteMapPath ID="smp1" runat="server" ></asp:SiteMapPath>
		</div>
		<div id="main2" style="margin-top: 8.6%; margin-left: 2%; margin-right: 60px; width: 76.8%">
			<asp:GridView ID="gvUser" runat="server" OnPageIndexChanging="gvUser_PageIndexChanging" OnRowDataBound="gvUser_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="15" CssClass="layui-table">
				<Columns>
					<asp:TemplateField HeaderText="序号" ItemStyle-Width="32px">
						<ItemStyle HorizontalAlign="Center" />
						<HeaderStyle HorizontalAlign="Center" Width="32px" />
					</asp:TemplateField>
					<asp:BoundField DataField="U_UserName" HeaderText="用户名" ItemStyle-Width="120px" />
					<asp:TemplateField HeaderText="姓名" ItemStyle-Width="120px" >
						<ItemTemplate>
							<asp:LinkButton ID="lbtnUserName" runat="server" Text='<%#Eval("U_ChineseName")%>' OnClick="lbtnUserName_Click"></asp:LinkButton>
						</ItemTemplate>
					</asp:TemplateField>
					<%--<asp:BoundField DataField="U_ChineseName" HeaderText="姓名" ItemStyle-Width="120px" />--%>
					<asp:BoundField DataField="U_Sex" HeaderText="性别" ItemStyle-Width="32px" />
					<asp:BoundField DataField="U_DepartmentName" HeaderText="部门" />
					<asp:BoundField DataField="U_Role" HeaderText="角色" ItemStyle-Width="120px" />
					<asp:BoundField DataField="U_PhoneNum" ItemStyle-Width="120px" HeaderText="电话" />
				</Columns>
				<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
				<RowStyle HorizontalAlign="Center" />
			</asp:GridView>
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
