<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddContent.ascx.cs" Inherits="Admin_Courseascx_AddContent" %>

<style type="text/css">
	.ddl
	{
		height:38px;
		width:190px;
		cursor:pointer;
		color:gray;
		text-align:center;
		padding-left:6px;
		border-right: Gainsboro 1px solid; 
		border-top: Gainsboro 1px solid; 
		border-left: Gainsboro 1px solid; 
		border-bottom: Gainsboro 1px solid;
	}

	/*让div内容居中*/
	.rdCss
	{
		height:38px;
		width:42.1%;
		line-height:38px;
		overflow:hidden;
	}
	.rd
	{
		margin-left:12px;
		/*margin-top:16px;*/
	}
	.button1{
		width:120px;
	}
	.button2{
		width:100px;
	}
	.button3{
		width:92px;
	}
	.button4{
		width:96px;
		position:absolute;
		overflow:hidden;
	}
	.imgSty
	{
		height:120px;
		width:100px;
	}
	input.FormText {
		color: gray;
		border: Gainsboro 1px solid;
	}
</style>

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

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 32px; margin-left: 120px; margin-right: 120px">
	<legend>
		<span style="font-size: 14pt">新增课程内容</span>
	</legend>
</fieldset>
<div id="test4" class="site-text site-block" style="margin-top: 24px; margin-left: 520px;">
	<table style="width: 100%; height: 100%;" align="center" >
		<tr>
			<td style="width: 45%">
				<div class="layui-form-item" style="vertical-align:middle">
					<label class="layui-form-label" style="text-align: right; vertical-align:middle">缩略图:</label>
					<div class="layui-input-inline">
						<asp:Image ID="imgFiles" runat="server" Width="400px" Height="300px"/>
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
					<div class="layui-input-block" style="width:45.6%">
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
					<table style="width:100%">
						<tr>
							<td style="width:20%">
								<label class="layui-form-label" style="text-align: right">所属课程:</label>
								<div class="layui-input-block">
									<asp:DropDownList ID="ddlCourse" runat="server" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged" AutoPostBack="true" CssClass="ddl"></asp:DropDownList>
								</div>
							</td>
							<td style="width:0.8%"></td>
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
					<table style="width:100%">
						<tr>
							<td style="width: 36.6%">
								<label class="layui-form-label" style="text-align: right">上传文件:</label>
								<div class="layui-input-block" style="width: 100%">
									<asp:FileUpload ID="fuFiles" runat="server" />
									<asp:TextBox ID="tbFilesPath" runat="server" autocomplete="off" CssClass="layui-input"></asp:TextBox>
								</div>
							</td>
							<td style="width: 0.2%"></td>
							<td style="width:63.2%; vertical-align:middle">
								<div class="layui-input-block" style="margin-bottom:2px;">
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
	<div style="margin-left:20%">
		<table>
			<tr>
				<td>
					<asp:Button ID="btnSaveCourseFiles" runat="server" Text="保存课件" CssClass="layui-btn" OnClick="btnSaveCourseFiles_Click" />
				</td>
				<td style="width:4%"></td>
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
