using GroceryList.Data.Entities;
using GroceryList.Data.POCOs;
using GroceryListSystem.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryListWebsite
{
    public partial class OLTP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FetchButton_Click(object sender, EventArgs e)
        {
            //need to use MessageUserControl?
            //fill in customer name and phone labels
            OrderListsController sysmgr = new OrderListsController();
            //error handling?
            Customer customer = sysmgr.Customers_Get(int.Parse(OrderDLL.SelectedValue));
            CustomerName.Text = customer.FullName;
            CustomerPhone.Text = customer.Phone;
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            //need to use MessageUserControl?
            //traverse gridview collecting info
            //send in list of picklist, pickerid and orderid to orderlistscontroller OrderLists_Picking
            OrderListsController sysmgr = new OrderListsController();
            List<PickList> pickedList = new List<PickList>();

            IEnumerable<GridViewRow> rows = PickList.Rows.Cast<GridViewRow>();

            pickedList = (from x in rows
                          select new PickList
                          {
                              OrderListID = int.Parse((x.FindControl("OrderListID") as Label).Text),
                              ProductDescription = (x.FindControl("ProductDescription") as Label).Text,
                              Quantity = double.Parse((x.FindControl("Quantity") as Label).Text),
                              Comment = (x.FindControl("Comment") as Label).Text,
                              QuantityPicked = float.Parse((x.FindControl("QuantityPicked") as TextBox).Text),
                              PickIssue = (x.FindControl("PickIssue") as TextBox).Text
                          }).ToList();

            //foreach(GridViewRow row in PickList.Rows)
            //{
            //    PickList picklist = new PickList();
            //    picklist.OrderListID = int.Parse((row.FindControl("OrderListID") as Label).Text);
            //    picklist.ProductDescription = (row.FindControl("ProductDescription") as Label).Text;
            //    picklist.Quantity = double.Parse((row.FindControl("Quantity") as Label).Text);
            //    picklist.Comment = (row.FindControl("Comment") as Label).Text;
            //    picklist.QuantityPicked = double.Parse((row.FindControl("QuantityPicked") as TextBox).Text);
            //    picklist.PickIssue = (row.FindControl("PickIssue") as TextBox).Text;
            //    pickedList.Add(picklist);
            //}

            sysmgr.OrderLists_Picking(int.Parse(PickerDLL.SelectedValue), int.Parse(OrderDLL.SelectedValue), pickedList);
        }
    }
}