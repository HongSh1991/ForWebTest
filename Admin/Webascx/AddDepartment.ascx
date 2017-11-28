<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddDepartment.ascx.cs" Inherits="Admin_Webascx_AddDepartment" %>

<style type="text/css">
	.ddl
	{
		height:38px;
		width:190px;
		cursor:pointer;
		color:gray;
		text-align:center;
		border-right: lightgrey 1px solid; 
		border-top: lightgrey 1px solid; 
		border-left: lightgrey 1px solid; 
		border-bottom: lightgrey 1px solid;
	}
</style>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 32px; margin-left: 120px; margin-right:120px">
	<legend>
		<span style="font-size: 14pt">部门信息管理</span>
	</legend>
</fieldset>
<!--新增部门-->
<div id="test2" class="site-text site-block" style="margin-top: 24px; margin-left: 150px; margin-right:150px">
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