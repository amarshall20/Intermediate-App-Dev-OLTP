<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QueryODS.aspx.cs" Inherits="GroceryListWebsite.QueryODS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h1>Query: ODS</h1>
    <asp:DropDownList ID="CategoryDDL" runat="server" DataSourceID="CategoryDDLODS" DataTextField="Description" DataValueField="CategoryID">
    </asp:DropDownList>
    <asp:Button ID="Search" runat="server" Text="Search"  />
    <asp:GridView ID="ProductGridView" runat="server" AutoGenerateColumns="False" DataSourceID="ProductGridViewODS" AllowPaging="True">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID"></asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" dataformatstring="{0:N2}"></asp:BoundField>
            <asp:BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" dataformatstring="{0:N2}"></asp:BoundField>
            <asp:BoundField DataField="UnitSize" HeaderText="Unit Size" SortExpression="UnitSize"></asp:BoundField>
            <asp:CheckBoxField DataField="Taxable" HeaderText="Taxable" SortExpression="Taxable"></asp:CheckBoxField>
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="CategoryDDLODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Categories_List" TypeName="GroceryListSystem.BLL.CategoryController">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProductGridViewODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Products_GetByCategoryID" TypeName="GroceryListSystem.BLL.ProductController">
        <SelectParameters>
            <asp:ControlParameter ControlID="CategoryDDL" PropertyName="SelectedValue" DefaultValue="1" Name="categoryid" Type="Int32"></asp:ControlParameter>
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
