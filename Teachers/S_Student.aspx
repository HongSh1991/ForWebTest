<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S_Student.aspx.cs" Inherits="Students_S_Student" %>
<%@ Register Src="~/Teachers/S_StudentHeader.ascx" TagName="S_StudentHeader" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
	<title></title>
	<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="../layui/css/layui.css" />
	<link rel="stylesheet" href="../Resources/Teacher/css/cssSty.css" />
	<link rel="stylesheet" href="../StyleSheet.css" type="text/css" />

	<style type="text/css">
		.button {
			cursor: pointer;
			border-radius: 6px;
		}

		.button1 {
			cursor: pointer;
			color:#1E9FFF;
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
			left: 1%;
			bottom: 0;
			width: 18%;
			height:71%;
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
			top: 22.8%;
			right: 8%;
			bottom: 0;
			overflow: hidden;
		}

		#main2 {
			position: absolute;
			left: 24%;
			top: 21.7%;
			right: 8%;
			bottom: 0;
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

	<script type="text/javascript">  
		var timer
		$(document).ready(function () {
			timer = setInterval(AutoScroll, 1600);

			$(".flow-default").mouseover(
				function () {
					clearInterval(timer);
				})
				.mouseout(function () {
					timer = setInterval(AutoScroll, 1600);
				});

			function AutoScroll() {
				$("#dem").find("ul:first").animate({
					marginTop: "0px"
				}, 1600, function () {
					$(this).css({ marginTop: "0px" }).find("li:first").appendTo(this);
				});
			}
		});
	</script>  
</head>
<body style="margin:auto">
	<form id="form1" runat="server" class="layui-form-pane">
		<div>
			<uc1:S_StudentHeader ID="S_StudentHeader" runat="server" />
			<ul class="layui-nav layui-bg-cyan">
				<li class="layui-nav-item" style="margin-left:4.6%">
					<span style="font-size:12pt">人员详细信息--<asp:Label ID="lbTips" runat="server" ForeColor="white" Font-Size="11pt" ></asp:Label></span>
				</li>
				<li class="layui-nav-item" style="margin-left:1.2%">
					<asp:LinkButton ID="lbtnBackToUp" runat="server" OnClick="lbtnBackToUp_Click">返回上页</asp:LinkButton>
				</li>
			</ul>
		</div>
		<aside class="aside" style="top:21.7%; width: 20%; background-color:white">
			<div style="height: 100%; width: 100%;">
				<table style="width: 100%; height: 100%;">
					<tr style="height:10%">
						<td></td>
					</tr>
					<tr style="height:12%">
						<td align="center" style="width: 100%;">
							<asp:Image ID="imgHead" runat="server" Width="160" Height="200" />
						</td>
					</tr>
					<tr style="height:2%">
						<td></td>
					</tr>
					<tr style="height:10%">
						<td align="center" style="width: 100%; padding-right:1%">
							<img alt="" src="../Resources/Student/images/userHead.png" width="30" height="30" />&nbsp;
							<img alt="" src="../Resources/Student/images/personInfo.png" width="30" height="30" />&nbsp;
							<img alt="" src="../Resources/Student/images/Index.png" width="30" height="30" />
						</td>
					</tr>
					<tr style="height:66%">
						<td>
							<table style="width: 100%; height: 100%">
								<tr style="height: 10%; width: 100%">
									<td style="width: 100%; font-size: 12pt;">
										<blockquote class="layui-elem-quote" style="height:20px; vertical-align:middle">
											<img alt="" src="../Resources/Student/images/Study2.png" width="30" height="30" style="margin-bottom:1%" />&nbsp;
								学习动态
										</blockquote>
									</td>
								</tr>
								<tr style="height: 90%; width: 100%">
									<td vaglin="middle" style="width: 100%; height: 100%">
										<div id="dem" style="width: 99.5%; height: 100%; overflow-x: hidden; overflow-y: auto; border-style:dashed; border-width:thin">
											<table>
												<tr>
													<td>
														<ul class="flow-default" style="width: 100%; height: 100%;">
															<asp:Repeater ID="repeaterUserInfo" runat="server">
																<ItemTemplate>
																	<li style="height:30px; vertical-align: middle">
																		<img alt="" src="../Resources/Student/images/circle.png" height="22" width="22" style="vertical-align: middle" />
																		<span style="font-size: 10pt; vertical-align: middle">
																			<%# Eval("SS_SStudyDate")%> 进行了 <%# Eval("SS_SStudyCourseName")%>, 任务完成度<%#Eval("SS_SStudyComDegree") %>%。
																		</span>
																	</li>
																</ItemTemplate>
															</asp:Repeater>
														</ul>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</aside>
		<div id="main2" style="margin-top: 8%; margin-left: 4%; width:76%; height:76%;">
			<div style="height:100%;">
				<table style="width:100%; height:100%">
					<tr style="height:10%; width:100%">
						<td style="width:100%; font-size:12pt;" colspan="3">
							<blockquote class="layui-elem-quote">
								<img alt="" src="../Resources/Student/images/dataCount1.png" width="30" height="30" />&nbsp;
								数据统计
							</blockquote>
						</td>
					</tr>
					<tr style="height:90%; width:100%; border-left-style:dashed; border-left-width:thin; border-right-style:dashed; border-right-width:thin">
						<td align="center" style="width:49.6%;">
							<div style="margin-top:8%">
								<span style="font-size:3.2em; font-weight:600;  color:#1E9FFF">任务列表</span>
							</div>
							<div style="overflow-y:auto; overflow-x:hidden; width:100%; height:66%; margin-top:3.6%; border-right-style:dashed; border-right-width:thin">
								<%--<asp:GridView ID="gvCount" runat="server"></asp:GridView>--%>
								<asp:Repeater ID="repeaterCount" runat="server">
									<ItemTemplate>
										<table>
											<tr>
												<td>
													<span style="font-size:2.1em">
														<asp:Button ID="btnTaskName" runat="server" Text='<%#Eval("任务名称")%>' BackColor="White" CssClass="button1" OnClick="btnTaskName_Click"></asp:Button>任务
														<asp:Label ID="taskFreq" runat="server" Text='<%#Eval("次数")%>'></asp:Label>次&nbsp;平均任务完成
														<asp:Label ID="taskAverPer" runat="server" Text='<%#Eval("平均任务完成度")%>'></asp:Label>%
													</span>
												</td>
											</tr>
										</table>
									</ItemTemplate>
								</asp:Repeater>
							</div>
						</td>
						<td style="width:0.8%;"></td>
						<td align="center" style="width:49.6%;">
							<div style="margin-top:8%">
								<span style="font-size:3.2em; font-weight:600;  color:#1E9FFF">近10次成绩变化曲线</span>
							</div>
							<div style="overflow-y:auto; overflow-x:hidden; width:100%; height:66%; margin-top:3.6%;">
								<asp:Chart ID="chartScore" runat="server" BackImageAlignment="Center" Width="560px" Height="320px">
									<Series>
										<asp:Series Name="Series1" ChartType="Line" IsValueShownAsLabel="True" LabelBorderDashStyle="Solid" Font="微软雅黑, 10pt"></asp:Series>
									</Series>
									<ChartAreas>
										<asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="False" IsSameFontSizeForAllAxes="True"></asp:ChartArea>
									</ChartAreas>
								</asp:Chart>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>

	<script src="../layui/layui.js" charset="utf-8"></script>
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
