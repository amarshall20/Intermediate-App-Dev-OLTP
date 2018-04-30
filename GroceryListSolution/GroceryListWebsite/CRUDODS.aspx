<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CRUDODS.aspx.cs" Inherits="GroceryListWebsite.CRUDODS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <asp:ListView ID="ProductListView" runat="server" DataSourceID="ProductListViewODS" InsertItemPosition="LastItem" DataKeyNames="ProductID">

        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF; color: #284775;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="ProductIDLabel" Width="50px" /></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /></td>
                <td>
                    <asp:Label Text='<%# String.Format("{0:N2}",Eval("Price")) %>' runat="server" ID="PriceLabel" Width="50px" /></td>
                <td>
                    <asp:Label Text='<%# String.Format("{0:N2}",Eval("Discount")) %>' runat="server" ID="DiscountLabel" Width="50px"/></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="UnitSizeLabel" /></td>
                <td>
                    <asp:DropDownList ID="CategoryList" runat="server" 
                        DataSourceID="CategoryDDLODS" 
                        DataTextField="Description" 
                        DataValueField="CategoryID"
                         selectedvalue='<%# Eval("CategoryID") %>'
                         Width="300px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="TaxableCheckBox" Enabled="false" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #999999;">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="ProductIDTextBox" Width="50px" ReadOnly = "true" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Price") %>' runat="server" ID="PriceTextBox" Width="50px"/></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Discount") %>' runat="server" ID="DiscountTextBox" Width="50px"/></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="UnitSizeTextBox" /></td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="CategoryDDLODS" 
                        DataTextField="Description" 
                        DataValueField="CategoryID"
                         selectedvalue='<%# Bind("CategoryID") %>'
                         Width="300px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:CheckBox Checked='<%# Bind("Taxable") %>' runat="server" ID="CheckBox1" /></td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="Button1" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("ProductID") %>' runat="server" ID="TextBox1" Width="50px" ReadOnly = "true" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="TextBox2" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Price") %>' runat="server" ID="TextBox3" Width="50px"/></td>
                <td>
                    <asp:TextBox Text='<%# Bind("Discount") %>' runat="server" ID="TextBox4" Width="50px"/></td>
                <td>
                    <asp:TextBox Text='<%# Bind("UnitSize") %>' runat="server" ID="TextBox5" /></td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" 
                        DataSourceID="CategoryDDLODS" 
                        DataTextField="Description" 
                        DataValueField="CategoryID"
                         selectedvalue='<%# Bind("CategoryID") %>'
                         Width="300px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:CheckBox Checked='<%# Bind("Taxable") %>' runat="server" ID="CheckBox2" /></td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #E0FFFF; color: #333333;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="Button2" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="Button3" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="Label1" Width="50px"/></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="Label2" /></td>
                <td>
                    <asp:Label Text='<%# String.Format("{0:N2}",Eval("Price")) %>' runat="server" ID="Label3" Width="50px"/></td>
                <td>
                    <asp:Label Text='<%# String.Format("{0:N2}",Eval("Discount")) %>' runat="server" ID="Label4" Width="50px"/></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="Label5" /></td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server" 
                        DataSourceID="CategoryDDLODS" 
                        DataTextField="Description" 
                        DataValueField="CategoryID"
                         selectedvalue='<%# Eval("CategoryID") %>'
                         Width="300px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="CheckBox3" Enabled="false" /></td>
           </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                <th runat="server"></th>
                                <th runat="server">ProductID</th>
                                <th runat="server">Description</th>
                                <th runat="server">Price</th>
                                <th runat="server">Discount</th>
                                <th runat="server">UnitSize</th>
                                <th runat="server">Category</th>
                                <th runat="server">Taxable</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #5D7B9D; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                <asp:NumericPagerField></asp:NumericPagerField>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="Button4" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="Button5" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("ProductID") %>' runat="server" ID="Label6" Width="50px"/></td>
                <td>
                    <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="Label7" /></td>
                <td>
                    <asp:Label Text='<%# String.Format("{0:N2}",Eval("Price")) %>' runat="server" ID="Label8" Width="50px"/></td>
                <td>
                    <asp:Label Text='<%# String.Format("{0:N2}",Eval("Discount")) %>' runat="server" ID="Label9" Width="50px"/></td>
                <td>
                    <asp:Label Text='<%# Eval("UnitSize") %>' runat="server" ID="Label10" />
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList4" runat="server" 
                        DataSourceID="CategoryDDLODS" 
                        DataTextField="Description" 
                        DataValueField="CategoryID"
                         selectedvalue='<%# Eval("CategoryID") %>'
                         Width="300px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:CheckBox Checked='<%# Eval("Taxable") %>' runat="server" ID="CheckBox4" Enabled="false" /></td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:ObjectDataSource ID="CategoryDDLODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Categories_List" TypeName="GroceryListSystem.BLL.CategoryController">
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ProductListViewODS" runat="server" DataObjectTypeName="GroceryList.Data.Entities.Product" DeleteMethod="Products_Delete" InsertMethod="Products_Add" OldValuesParameterFormatString="original_{0}" SelectMethod="Products_List" TypeName="GroceryListSystem.BLL.ProductController" UpdateMethod="Products_Update">
    </asp:ObjectDataSource>
</asp:Content>

