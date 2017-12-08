<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowTask.aspx.cs" Inherits="Admin_ShowTask" %>
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
			right: 0%;
			bottom: 0;
			overflow: hidden;
		}

		#main2 {
			position: absolute;
			left: 8%;
			top: 0.06%;
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
<body style="overflow-y:hidden; margin: auto;">
	<form id="form1" runat="server" class="layui-form-pane">
		<div>
			<uc1:Header ID="Header1" runat="server" />
		</div>
		<div id="main1" style="height: 100%;">
			<table style="height: 100%; width: 100%">
				<tr>
					<td>
						<aside class="aside">
							<div style="height: 10%; width: 100%; padding-left:6.6%; margin-top: 4%">
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
											<div class="layui-form-item" style="margin-right: 14.6%;">
												<asp:Button ID="btnSearchCourse" runat="server" Text="搜索课程" CssClass="layui-btn buttonSearch" OnClick="btnSearchCourse_Click" />
											</div>
										</td>
									</tr>
								</table>
							</div>
						</aside>
						<div id="main2" style=" overflow-x: hidden; overflow-y: auto; margin-left:12%; width:80%; height:78.2%;">
							<fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%; margin-left:2%; margin-right:14%">
								<legend>
									<span style="font-size: 14pt">课程内容目录</span>
								</legend>
							</fieldset>
							<div style="margin-top: 1%; width:100%; margin-left: 2%;">
								<asp:DataList ID="dlCourseContent" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnDeleteCommand="dlCourseContent_DeleteCommand" OnEditCommand="dlCourseContent_EditCommand" OnItemDataBound="dlCourseContent_ItemDataBound">
									<ItemTemplate>
										<div align="center" style="padding-left: 28px; padding-right: 28px;">
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
														<td style="width: 66%;" align="right">
															<asp:LinkButton ID="lbtnEdit" runat="server" CssClass="layui-btn layui-btn-sm button2" Text="编辑" ToolTip='<%#Eval("CF_CFileID")%>' OnClick="lbtnEdit_Click"></asp:LinkButton>
															<asp:LinkButton ID="lbtnDelete" runat="server" Text="删除" CssClass="layui-btn layui-btn-danger layui-btn-sm button2" CommandName="delete" CommandArgument='<%#Eval("CF_CFileID")%>'></asp:LinkButton>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</ItemTemplate>
								</asp:DataList>
								<div style="height: 20px"></div>
								<div style="width: 100%;">
									<table style="width: 100%; margin-bottom: 2%;">
										<tr>
											<td style="width: 46%"></td>
											<td style="width: 11.4%" align="right">
												<span>当前页码为：[&nbsp;<asp:Label ID="labCurrentPage" runat="server" Text="1"></asp:Label>&nbsp;]
												</span>
											</td>
											<td style="width: 8.6%" align="right">
												<span>&nbsp;总页码为：[&nbsp;<asp:Label ID="labTotalPage" runat="server"></asp:Label>&nbsp;]&nbsp;&nbsp;
												</span>
											</td>
											<td style="width: 34%;" align="left">
												<asp:LinkButton ID="lbFirstPage" runat="server" CssClass="linkButtonStyle" OnClick="lbFirstPage_Click">第一页</asp:LinkButton>
												<asp:LinkButton ID="lbFrontPage" runat="server" CssClass="linkButtonStyle" OnClick="lbFrontPage_Click">上一页</asp:LinkButton>
												<asp:LinkButton ID="lbNextPage" runat="server" CssClass="linkButtonStyle" OnClick="lbNextPage_Click">下一页</asp:LinkButton>
												<asp:LinkButton ID="lbLastPage" runat="server" CssClass="linkButtonStyle" OnClick="lbLastPage_Click">最后一页</asp:LinkButton>
											</td>
										</tr>
									</table>
								</div>
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
