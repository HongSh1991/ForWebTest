<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskListShow.aspx.cs" Inherits="Teachers_TaskListShow" %>
<%@ Register Src="~/Teachers/T_Header.ascx" TagName="T_Header" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title></title>
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
	<form id="form1" runat="server"  class="layui-form-pane">
		<div>
			<uc1:T_Header ID="T_Header1" runat="server" />
		</div>

		<aside class="aside" style="top:21.7%; width: 18%;">
			<div style="height: 10%; width: 100%; margin-top: 7.1%; margin-left: 6%; margin-right: 150px">
				<table style="width: 100%; height: 100%">
					<tr>
						<td style="width: 100%">
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">课件名称:</label>
								<div class="layui-input-inline">
									<asp:TextBox ID="tbFileName" runat="server" placeholder="请输入课件名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label" style="text-align: right">所属目录:</label>
								<div class="layui-input-inline">
									<asp:DropDownList ID="ddlContentBelong" runat="server" AutoPostBack="True" CssClass="ddl" OnSelectedIndexChanged="ddlContentBelong_SelectIndexChange">
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
								<asp:Button ID="btnSearchCourse" runat="server" Text="搜索课程" CssClass="layui-btn buttonSearch" OnClick="btnSearchCourse_Click" />
							</div>
						</td>
					</tr>
				</table>
			</div>
		</aside>

		<div style="margin-top: 0.6%; margin-left: 21%; margin-right: 60px; width: 76.8%">
			<asp:SiteMapPath ID="smp1" runat="server" ></asp:SiteMapPath>
		</div>
		<div id="main2" style="margin-top: 9%; margin-left: 0.6%; margin-right: 60px; width: 78.2%; overflow-x:hidden; overflow-y:auto">
			<asp:DataList ID="dlCourseContent" runat="server" RepeatColumns="4" RepeatDirection="Horizontal">
				<ItemTemplate>
					<div align="center" style="padding-left: 28px; padding-right: 12px;">
						<table>
							<tr>
								<td>
									<asp:Image ID="imgCourseFiles" runat="server" BorderStyle="Solid" Height="240px" Width="320px" ImageAlign="AbsMiddle" />
								</td>
							</tr>
							<tr>
								<td style="height: 10px;"></td>
							</tr>
							<tr>
								<td>
									<asp:Label ID="labCourseFileName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "CF_CFileName")%>'></asp:Label>
								</td>
							</tr>
						</table>
						<div style="width: 100%;">
							<table style="width: 100%; margin-bottom: 4%;">
								<tr>
									<td style="width: 10%">
										<asp:Image ID="imgIcon" runat="server" Height="24px" Width="24px" ImageUrl='<%#Eval("CF_CFileIcon")%>' />
									</td>
									<td style="width: 24%;"></td>
									<td style="width: 66%; color:white" align="right">
										<a href="DownLoadFiles.aspx?CF_CFileID='<%#Eval("CF_CFileID")%>'" target="_blank" class="layui-btn layui-btn-sm button2 layui-btn-primary"><span style="font-weight:500">下载</span></a>
										<%--<asp:Button ID="btnEdit" runat="server" CssClass="layui-btn layui-btn-sm button2" Text="下载"></asp:Button>--%>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</ItemTemplate>
			</asp:DataList>
			<div style="height: 20px"></div>
			<div style="width: 100%;">
				<table style="width: 100%; margin-bottom: 1%;">
					<tr>
						<td style="width: 66%"></td>
						<td style="width: 10%" align="right">
							<span>当前页码为：[&nbsp;<asp:Label ID="labCurrentPage" runat="server" Text="1"></asp:Label>&nbsp;]
							</span>
						</td>
						<td style="width: 8%" align="center">
							<span>&nbsp;总页码为：[&nbsp;<asp:Label ID="labTotalPage" runat="server"></asp:Label>&nbsp;]
							</span>
						</td>
						<td style="width: 16%;" align="left">
							<asp:LinkButton ID="lbFirstPage" runat="server" CssClass="linkButtonStyle" OnClick="lbFirstPage_Click">第一页</asp:LinkButton>
							<asp:LinkButton ID="lbFrontPage" runat="server" CssClass="linkButtonStyle" OnClick="lbFrontPage_Click">上一页</asp:LinkButton>
							<asp:LinkButton ID="lbNextPage" runat="server" CssClass="linkButtonStyle" OnClick="lbNextPage_Click">下一页</asp:LinkButton>
							<asp:LinkButton ID="lbLastPage" runat="server" CssClass="linkButtonStyle" OnClick="lbLastPage_Click">最后一页</asp:LinkButton>
						</td>
					</tr>
				</table>
			</div>
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
