<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OLTP.aspx.cs" Inherits="GroceryListWebsite.OLTP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row col-md-12">
        <asp:DropDownList ID="OrderDLL" AppendDataBoundItems="true" runat="server" DataSourceID="OrderDLLODS" DataTextField="OrderID" DataValueField="OrderID">
            <asp:ListItem Text="Please select an order..." Value="0" />
        </asp:DropDownList>
        <asp:Button ID="FetchButton" runat="server" Text="Fetch" OnClick="FetchButton_Click" />
        <asp:Label ID="Customer" runat="server" Text="Customer:" Font-Underline="true" ></asp:Label>
        <asp:Label ID="CustomerName" runat="server" ></asp:Label>
        <asp:Label ID="Contact" runat="server" Text="Contact:" Font-Underline="true" ></asp:Label>
        <asp:Label ID="CustomerPhone" runat="server" ></asp:Label>
        <asp:Label ID="Picker" runat="server" Text="Picker:" Font-Underline="true" ></asp:Label>
        <asp:DropDownList ID="PickerDLL" runat="server" DataSourceID="PickerDLLODS" DataTextField="FullName" DataValueField="PickerID"></asp:DropDownList>

        <asp:ObjectDataSource ID="OrderDLLODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Orders_UnDeliveredList" TypeName="GroceryListSystem.BLL.OrdersController"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="PickerDLLODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Pickers_List" TypeName="GroceryListSystem.BLL.PickersController"></asp:ObjectDataSource>
    </div>

    <div class="row">
        <asp:GridView ID="PickList" runat="server" AutoGenerateColumns="False" DataSourceID="PickListODS">
            <Columns>
                <asp:TemplateField HeaderText="OrderListID" SortExpression="OrderListID" Visible="False">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("OrderListID") %>' ID="OrderListID"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("OrderListID") %>' ID="OrderListID"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ProductDescription" SortExpression="ProductDescription">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("ProductDescription") %>' ID="ProductDescription"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("ProductDescription") %>' ID="ProductDescription"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Quantity") %>' ID="Quantity"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Quantity") %>' ID="Quantity"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comment" SortExpression="Comment">
                    <EditItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Comment") %>' ID="Comment"></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%# Bind("Comment") %>' ID="Comment"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="QuantityPicked" SortExpression="QuantityPicked">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("QuantityPicked") %>' ID="QuantityPicked"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("QuantityPicked") %>' ID="QuantityPicked"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PickIssue" SortExpression="PickIssue">
                    <EditItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("PickIssue") %>' ID="PickIssue"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox runat="server" Text='<%# Bind("PickIssue") %>' ID="PickIssue"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>

        <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />

        <asp:ObjectDataSource ID="PickListODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="OrderLists_OrderPickList" TypeName="GroceryListSystem.BLL.OrderListsController">
            <SelectParameters>
                <asp:ControlParameter ControlID="OrderDLL" PropertyName="SelectedValue" Name="orderid" Type="Int32"></asp:ControlParameter>
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>

</asp:Content>
