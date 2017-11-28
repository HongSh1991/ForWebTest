<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddUserInfo.ascx.cs" Inherits="Admin_Webascx_AddUserInfo" %>

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

<script src="../../Resources/Admin/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="../Resources/Common/js/jquery-1.12.3.min.js" type="text/javascript"></script>

<!--新增人员-->
<div id="test4" class="site-text site-block" style="margin-top: 24px; margin-left: 360px;">
	<table style="width: 100%; height: 100%;" align="center">
		<tr>
			<td style="width: 45%">
				<div class="layui-form-item">
					<label class="layui-form-label" style="text-align: right">用户名:</label>
					<div class="layui-input-inline">
						<asp:TextBox ID="tbAddUserName" runat="server" placeholder="请输入用户名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
					</div>
				</div>
			</td>
			<td rowspan="4" align="left" style="width: 40%; vertical-align: top">
				<div class="layui-form-item" style="margin-left: 4%;">
					<asp:Image ID="imgUser" runat="server" CssClass="imgSty"/>
				</div>
				<div class="layui-form-item" style="margin-left: 4%; width: 100%">
					<asp:FileUpload ID="fUploadUser" runat="server" CssClass="FormText" />
				</div>
				<div class="layui-form-item" style="margin-left: 4%; width: 100%">
					<asp:Button ID="btnSaveImg" runat="server" Text="确认上传头像" CssClass="layui-btn layui-btn-sm button2" OnClick="btnSaveImg_Click" />
					<asp:Label ID="lbShowTips" runat="server" Text=""></asp:Label>
				</div>

			</td>
			<td style="width: 15%"></td>
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
					<label class="layui-form-label" style="text-align: right">密码:</label>
					<div class="layui-input-inline">
						<asp:TextBox ID="tbAddPassWord" runat="server" placeholder="请输入密码" autocomplete="off" CssClass="layui-input"></asp:TextBox>
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
					<label class="layui-form-label" style="text-align: right">中文名:</label>
					<div class="layui-input-inline">
						<asp:TextBox ID="tbAddChineseName" runat="server" placeholder="请输入中文名" autocomplete="off" CssClass="layui-input"></asp:TextBox>
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
					<label class="layui-form-label" style="text-align: right">性别:</label>
					<div class="layui-input-block rdCss">
						<asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" Width="100px" CellPadding="4" CssClass="rd">
							<asp:ListItem Value="0" Selected="True">男</asp:ListItem>
							<asp:ListItem Value="1">女</asp:ListItem>
						</asp:RadioButtonList>
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
					<label class="layui-form-label" style="text-align: right">角色:</label>
					<div class="layui-input-block rdCss">
						<asp:RadioButtonList ID="rblRole" runat="server" RepeatDirection="Horizontal" Width="300px" CellPadding="4" CssClass="rd">
							<asp:ListItem Value="0" Selected="True">普通用户</asp:ListItem>
							<asp:ListItem Value="1">教师</asp:ListItem>
							<asp:ListItem Value="2">系统操作员</asp:ListItem>
						</asp:RadioButtonList>
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
					<label class="layui-form-label" style="text-align: right">学历:</label>
					<div class="layui-input-block rdCss">
						<asp:RadioButtonList ID="rblEducation" runat="server" RepeatDirection="Horizontal" Width="300px" CellPadding="4" CssClass="rd">
							<asp:ListItem Value="0" Selected="True">学士</asp:ListItem>
							<asp:ListItem Value="1">硕士</asp:ListItem>
							<asp:ListItem Value="2">博士</asp:ListItem>
							<asp:ListItem Value="3">其他</asp:ListItem>
						</asp:RadioButtonList>
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
								<label class="layui-form-label" style="text-align: right">部门:</label>
								<div class="layui-input-block">
									<asp:DropDownList ID="ddlAddDepartment" runat="server" placeholder="请选择部门名称" OnSelectedIndexChanged="ddlAddDepartment_SelectedIndexChanged" AutoPostBack="true" CssClass="ddl"></asp:DropDownList>
								</div>
							</td>
							<td style="width:0.8%"></td>
							<td align="left">
								<label class="layui-form-label" style="text-align: right">岗位:</label>
								<div class="layui-input-block">
									<asp:DropDownList ID="ddlAddJob" runat="server" placeholder="请选择部门名称" CssClass="ddl"></asp:DropDownList>
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
					<label class="layui-form-label" style="text-align: right">联系电话:</label>
					<div class="layui-input-inline">
						<asp:TextBox ID="tbAddContact" runat="server" placeholder="请输入联系电话" autocomplete="off" CssClass="layui-input"></asp:TextBox>
					</div>
					<label class="layui-form-label" style="text-align: right">入职时间:</label>
					<div class="layui-input-inline">
						<asp:TextBox ID="tbAddDatetime" runat="server" placeholder="请输入入职时间" autocomplete="off" CssClass="layui-input" Onclick="WdatePicker()"></asp:TextBox>
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
					<label class="layui-form-label" style="text-align: right">联系地址:</label>
					<div class="layui-input-block" style="width: 40.4%">
						<asp:TextBox ID="tbAddAdress" runat="server" placeholder="请输入联系地址" autocomplete="off" CssClass="layui-input"></asp:TextBox>
					</div>
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
					<asp:Button ID="btnSaveAdd" runat="server" Text="保存人员信息" CssClass="layui-btn" OnClick="btnSaveAdd_Click" />
				</td>
				<td style="width:4%"></td>
				<td>
					<input type="reset" class="layui-btn button1" />
				</td>
			</tr>
		</table>
	</div>
</div>