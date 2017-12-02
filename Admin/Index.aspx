<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Admin_Index" %>

<%@ Register Src="~/Admin/Webascx/Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Src="~/Admin/Webascx/AddOrgContent.ascx" TagName="AddOrgContent" TagPrefix="uc2" %>
<%@ Register Src="~/Admin/Webascx/AddDepartment.ascx" TagName="AddDepartment" TagPrefix="uc3" %>
<%@ Register Src="~/Admin/Webascx/AddJob.ascx" TagName="AddJob" TagPrefix="uc4" %>
<%@ Register Src="~/Admin/Webascx/AddUserInfo.ascx" TagName="AddUserInfo" TagPrefix="uc5" %>
<%@ Register Src="~/Admin/Courseascx/AddCourse.ascx" TagName="AddCourse" TagPrefix="uc6" %>
<%@ Register Src="~/Admin/Courseascx/AddContent.ascx" TagName="AddContent" TagPrefix="uc7" %>

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
<body style="margin: auto; overflow-x: hidden; overflow-y: auto">
	<form id="form1" runat="server" class="layui-form-pane">
		<div style="height: 28%;">
			<uc1:Header ID="Header1" runat="server" />
		</div>
		<ul class="layui-nav layui-bg-cyan">
			<li class="layui-nav-item">
				<asp:Label ID="lbTips" runat="server" Font-Names="华文楷体" Font-Bold="true" ForeColor="white" Font-Size="1.6em"></asp:Label>
			</li>
			<li class="layui-nav-item">
				<asp:LinkButton ID="lbUserManager" runat="server" OnClick="lbUserManager_Click">人员管理</asp:LinkButton>
				<dl class="layui-nav-child">
					<!-- 二级菜单 修改二级菜单至导航栏的距离只要修改 layui.css 文件中的layui-nav-child属性top为44px就好了-->
					<%--<dd><asp:LinkButton ID="lbViewUser" runat="server" OnClick="lbViewUser_Click">查看人员</asp:LinkButton></dd>--%>
					<dd>
						<asp:LinkButton ID="lbDepartInfo" runat="server" OnClick="lbDepartInfo_Click">部门信息管理</asp:LinkButton></dd>
					<dd>
						<asp:LinkButton ID="lbUserInfo" runat="server" OnClick="lbUserInfo_Click">人员信息管理</asp:LinkButton></dd>
				</dl>
			</li>
			<li class="layui-nav-item">
				<asp:LinkButton ID="lbCourseManager" runat="server" OnClick="lbCourseManager_Click">课程管理</asp:LinkButton>
				<dl class="layui-nav-child">
					<!-- 二级菜单 -->
					<dd>
						<asp:LinkButton ID="lbCourseClassify" runat="server" OnClick="lbCourseClassify_Click">课程分类管理</asp:LinkButton></dd>
					<dd>
						<asp:LinkButton ID="lbAddCourses" runat="server" OnClick="lbAddCourses_Click">新增课程内容</asp:LinkButton></dd>
				</dl>
			</li>
		</ul>

		<div style="height: 56%;">
			<table style="height: 100%; width: 100%">
				<tr>
					<td>
						<asp:MultiView ID="mvPages" runat="server" ActiveViewIndex="0">
							<asp:View ID="vUserManager" runat="server">
								<div id="main" style="overflow-x: hidden; overflow-y: auto;">
									<table style="height: 100%; width: 100%">
										<tr>
											<td style="height: 100%; width: 100%; vertical-align: top">
												<asp:MultiView ID="mvPages1" runat="server" ActiveViewIndex="0">
													<asp:View ID="vDataTable" runat="server">
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
																				<asp:TextBox ID="tbSearchUserName" runat="server" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
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
													</asp:View>
													<asp:View ID="vDepartment" runat="server">
														<table style="height: 100%; width: 100%">
															<tr style="height: 30%; width: 100%">
																<td style="width: 100%; vertical-align: top">
																	<uc2:AddOrgContent ID="AddOrgContent" runat="server" />
																</td>
															</tr>
															<tr style="height: 30%;">
																<td style="width: 100%">
																	<uc3:AddDepartment ID="AddDepartment" runat="server" />
																</td>
															</tr>
															<tr style="height: 40%;">
																<td style="width: 100%">
																	<uc4:AddJob ID="AddJob" runat="server" />
																</td>
															</tr>
														</table>
													</asp:View>
													<asp:View ID="vUserInfo" runat="server">
														<fieldset class="layui-elem-field layui-field-title" style="margin: 32px 60px 0 60px;">
															<legend>
																<span style="font-size: 14pt">人员信息管理</span>
															</legend>
														</fieldset>
														<table style="height: 100%; width: 100%">
															<tr style="height: 100%; width: 100%">
																<td style="width: 100%; vertical-align: top; margin: 0 120px 0 0;">
																	<uc5:AddUserInfo ID="AddUserInfo" runat="server" />
																</td>
															</tr>
														</table>
													</asp:View>
												</asp:MultiView>
											</td>
										</tr>
									</table>
								</div>
							</asp:View>
							<asp:View ID="vCourseManager" runat="server">
								<div id="main1" style="overflow-y: auto; overflow-x: hidden;">
									<table style="height: 100%; width: 100%">
										<tr>
											<td style="height: 100%; width: 100%; vertical-align: top">
												<asp:MultiView ID="mvPages2" runat="server" ActiveViewIndex="0">
													<asp:View ID="vCourses" runat="server">
														<aside class="aside">
															<div style="height: 10%; width: 100%; padding-left: 4%; margin-top: 4%">
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
																			<div class="layui-form-item" style="margin-right: 7.2%;">
																				<asp:Button ID="btnSearchCourse" runat="server" Text="搜索课程" CssClass="layui-btn buttonSearch" OnClick="btnSearchCourse_Click" />
																			</div>
																		</td>
																	</tr>
																</table>
															</div>
														</aside>
														<div>
															<fieldset class="layui-elem-field layui-field-title" style="margin-top: 1%; margin-left: 340px; margin-right: 120px">
																<legend>
																	<span style="font-size: 14pt">课程内容目录</span>
																</legend>
															</fieldset>
															<div id="main2" align="center" style="margin-left: 36px; margin-right: 264px; overflow-x: hidden; overflow-y: auto;">
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
																							<asp:LinkButton ID="lbtnEdit" runat="server" CssClass="layui-btn layui-btn-sm button2" Text="编辑" CommandName="edit" ></asp:LinkButton>
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
																			<td style="width: 60%"></td>
																			<td style="width: 10%" align="right">
																				<span>当前页码为：[&nbsp;<asp:Label ID="labCurrentPage" runat="server" Text="1"></asp:Label>&nbsp;]
																				</span>
																			</td>
																			<td style="width: 10%" align="left">
																				<span>&nbsp;总页码为：[&nbsp;<asp:Label ID="labTotalPage" runat="server"></asp:Label>&nbsp;]&nbsp;&nbsp;
																				</span>
																			</td>
																			<td style="width: 20%;" align="left">
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
													</asp:View>
													<asp:View ID="vCourseClassify" runat="server">
														<table style="height: 100%; width: 100%">
															<tr style="height: 100%; width: 100%">
																<td style="width: 100%; vertical-align: top; margin: 0 120px 0 0;">
																	<uc6:AddCourse ID="AddCourse1" runat="server" />
																</td>
															</tr>
														</table>
													</asp:View>
													<asp:View ID="vAddCourses" runat="server">
														<table style="height: 100%; width: 100%">
															<tr style="height: 100%; width: 100%">
																<td style="width: 100%; vertical-align: top; margin: 0 120px 0 0;">
																	<uc7:AddContent ID="AddContent1" runat="server" />
																</td>
															</tr>
														</table>
													</asp:View>
												</asp:MultiView>
											</td>
										</tr>
									</table>
								</div>
							</asp:View>
						</asp:MultiView>
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
