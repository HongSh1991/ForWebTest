<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddOrgContent.ascx.cs" Inherits="Admin_Webascx_AddOrgContent" %>

<style type="text/css">

</style>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 32px; margin-left: 120px; margin-right:120px">
	<legend>
		<span style="font-size: 14pt">机构信息管理</span>
	</legend>
</fieldset>
<!--新增机构目录-->
<div id="test1" class="site-text site-block" style="margin-top: 24px; margin-left: 150px; margin-right: 150px">
	<div class="layui-form-item">
		<label class="layui-form-label" style="text-align: right">机构名称:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbOrgName" runat="server" placeholder="请输入机构名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>
		<div align="left">
			<asp:Button ID="btnSaveOrgContent" runat="server" Text="保存机构名称" CssClass="layui-btn" OnClick="btnSaveOrgContent_Click" />
		</div>
	</div>

	<asp:GridView ID="gvOrgContent" runat="server" OnRowEditing="gvOrgContent_RowEditing" OnRowUpdating="gvOrgContent_RowUpdating" OnRowDeleting="gvOrgContent_RowDeleting" OnRowCancelingEdit="gvOrgContent_RowCancelingEdit" OnPageIndexChanging="gvOrgContent_PageIndexChanging" OnRowDataBound="gvOrgContent_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
		<Columns>
			<asp:BoundField DataField="O_OrgID" HeaderText="序号" ItemStyle-Width="32px" />
			<asp:BoundField DataField="O_OrgName" HeaderText="机构名称" />
			<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
			<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>
