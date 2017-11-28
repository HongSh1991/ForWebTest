<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddCourse.ascx.cs" Inherits="Admin_Courseascx_AddCourse" %>

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
		<span style="font-size: 14pt">课程名称管理</span>
	</legend>
</fieldset>
<!--新增机构目录-->
<div id="test1" class="site-text site-block" style="margin-top: 24px; margin-left: 150px; margin-right: 150px">
	<div class="layui-form-item">
		<label class="layui-form-label" style="text-align: right">课程名称:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbCouName" runat="server" placeholder="请输入课程名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>
		<div align="left">
			<asp:Button ID="btnSaveCourse" runat="server" Text="保存课程名称" CssClass="layui-btn" OnClick="btnSaveCourse_Click" />
		</div>
	</div>

	<asp:GridView ID="gvCourse" runat="server" OnRowEditing="gvCourse_RowEditing" OnRowUpdating="gvCourse_RowUpdating" OnRowDeleting="gvCourse_RowDeleting" OnRowCancelingEdit="gvCourse_RowCancelingEdit" OnPageIndexChanging="gvCourse_PageIndexChanging" OnRowDataBound="gvCourse_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
		<Columns>
			<asp:BoundField DataField="C_CouID" HeaderText="序号" ItemStyle-Width="32px" />
			<asp:BoundField DataField="C_CouName" HeaderText="课程名称" />
			<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
			<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 32px; margin-left: 120px; margin-right:120px">
	<legend>
		<span style="font-size: 14pt">课程目录管理</span>
	</legend>
</fieldset>
<!--新增部门-->
<div id="test2" class="site-text site-block" style="margin-top: 24px; margin-left: 150px; margin-right:150px">
	<div class="layui-form-item">
		<label class="layui-form-label" style="text-align: right">目录名称:</label>
		<div class="layui-input-inline">
			<asp:TextBox ID="tbAddCourseContent" runat="server" placeholder="请输入目录名称" autocomplete="off" CssClass="layui-input"></asp:TextBox>
		</div>
		<label class="layui-form-label" style="text-align: right">所属课程:</label>
		<div class="layui-input-inline">
			<asp:DropDownList ID="ddlCourse" runat="server" placeholder="请选择课程名称" CssClass="ddl">
			</asp:DropDownList>
		</div>
		<div align="left">
			<asp:Button ID="btnCourseContent" runat="server" Text="保存课程目录" CssClass="layui-btn" OnClick="btnCourseContent_Click" />
		</div>
	</div>
	<asp:GridView ID="gvCourseContent" runat="server" OnRowEditing="gvCourseContent_RowEditing" OnRowUpdating="gvCourseContent_RowUpdating" OnRowDeleting="gvCourseContent_RowDeleting" OnRowCancelingEdit="gvCourseContent_RowCancelingEdit" OnPageIndexChanging="gvCourseContent_PageIndexChanging" OnRowDataBound="gvCourseContent_RowDataBound" AutoGenerateColumns="False" AllowPaging="true" PageSize="5" CssClass="layui-table">
		<Columns>
			<asp:BoundField DataField="CC_CConID" HeaderText="序号" ItemStyle-Width="32px" />
			<asp:BoundField DataField="CC_CConName" HeaderText="目录名称" />
			<asp:BoundField DataField="C_CouName" HeaderText="课程名称" />
			<asp:CommandField HeaderText="编辑" ControlStyle-CssClass="layui-btn layui-btn-sm" ShowEditButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
			<asp:CommandField HeaderText="删除" ControlStyle-CssClass="layui-btn layui-btn-danger layui-btn-sm" ShowDeleteButton="true" ControlStyle-Width="100px" ItemStyle-Width="240px" />
		</Columns>
		<HeaderStyle HorizontalAlign="Center" BackColor="LightGray" />
		<RowStyle HorizontalAlign="Center" />
	</asp:GridView>
</div>