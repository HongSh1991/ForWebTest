<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S_Index.aspx.cs" Inherits="Students_S_Index" %>
<%@ Register Src="~/Students/S_Header.ascx" TagName="S_Header" TagPrefix="uc1" %>

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
			left: 1%;
			bottom: 0;
			width: 18%;
			height:78%;
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
</head>
<body>
	<form id="form1" runat="server" class="layui-form-pane">
		<div>
			<uc1:S_Header ID="S_Header1" runat="server" />
		</div>
		<aside class="aside" style="top:21.7%; width: 18%; background-color:white">
			<div style="height: 100%; width: 100%;">
				<table style="width: 100%; height: 100%;">
					<tr style="height:12%">
						<td></td>
					</tr>
					<tr style="height:10%">
						<td align="center" style="width: 100%;">
							<asp:Image ID="imgHead" runat="server" Width="100" Height="120" BorderStyle="Solid" />
						</td>
					</tr>
					<tr style="height:10%">
						<td align="center" style="width: 100%; padding-right:1%">
							<img alt="" src="../Resources/Student/images/userHead.png" width="30" height="30" />&nbsp;
							<img alt="" src="../Resources/Student/images/personInfo.png" width="30" height="30" />&nbsp;
							<img alt="" src="../Resources/Student/images/Index.png" width="30" height="30" />
						</td>
					</tr>
					<tr style="height:64%"><td></td></tr>
				</table>
			</div>
		</aside>
		<div id="main2" style="margin-top: 7.2%; margin-left: 1%; width:72%; height:76%;">
			<div style="height:50%; margin-top:-1%;">
				<table style="width:100%; height:50%">
					<tr style="height:50%; width:100%">
						<td style="width:100%; font-size:12pt;">
							<blockquote class="layui-elem-quote">
								<img alt="" src="../Resources/Student/images/Study2.png" width="30" height="30" />&nbsp;
								学习动态
							</blockquote>
						</td>
					</tr>
					<tr style="height:50%; width:100%">
						<td>
							
						</td>
					</tr>
				</table>
			</div>
			<div style="height:50%; margin-top:-1%;">
				<table style="width:100%; height:50%">
					<tr style="height:50%; width:100%">
						<td style="width:100%; font-size:12pt;" colspan="3">
							<blockquote class="layui-elem-quote">
								<img alt="" src="../Resources/Student/images/dataCount1.png" width="30" height="30" />&nbsp;
								数据统计
							</blockquote>
						</td>
					</tr>
					<tr style="height:50%; width:100%">
						<td style="width:49%">
							
						</td>
						<td style="width:2%;"></td>
						<td style="width:49%">
							
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
