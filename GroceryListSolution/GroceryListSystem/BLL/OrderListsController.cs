using GroceryList.Data.Entities;
using GroceryList.Data.POCOs;
using GroceryListSystem.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GroceryListSystem.BLL
{
    [DataObject]
    public class OrderListsController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<PickList> OrderLists_OrderPickList(int orderid)
        {
            using (var context = new GroceryListContext())
            {
                //using orderid, return all the order details for that order
                //use a LINQ query that selects the information needed for a list of PickList(P)
                List<PickList> pickedList = (from x in context.OrderLists where x.Order.OrderID.Equals(orderid)
                                            select new PickList
                                            {
                                                OrderListID = x.OrderListID,
                                                ProductDescription = x.Product.Description,
                                                Quantity = x.QtyOrdered,
                                                Comment = x.CustomerComment,
                                                QuantityPicked = x.QtyPicked,
                                                PickIssue = x.PickIssue
                                            }).ToList();
                return pickedList;
            }
        }
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public Customer Customers_Get(int orderid)
        {
            using (var context = new GroceryListContext())
            {
                //using orderid, return the associated customer
                return context.Orders.Where(x => x.OrderID == orderid).Select(x => x.Customer).FirstOrDefault();
            }
        }

        public void OrderLists_Picking(int pickerid, int orderid, List<PickList> picklists)
        {
            //TRX
            using (var context = new GroceryListContext())
            {
                //update order - pickerid, pickeddate
                Order order = context.Orders.Where(x => x.OrderID == orderid).FirstOrDefault();
                order.PickerID = pickerid;
                order.PickedDate = DateTime.Now.Date;
                context.Entry(order).State = System.Data.Entity.EntityState.Modified;

                //update orderlists - PickList(P) needs OrderListID, loop through the list of PickLists and transfer info to corresponding orderlist 
                foreach (PickList picklist in picklists)
                {
                    OrderList orderlist = context.OrderLists.Where(x => x.OrderListID == picklist.OrderListID).SingleOrDefault();
                    orderlist.QtyPicked = picklist.QuantityPicked;
                    orderlist.PickIssue = string.IsNullOrEmpty(picklist.PickIssue) ? null : picklist.PickIssue;
                    context.Entry(orderlist).State = System.Data.Entity.EntityState.Modified;
                }
                context.SaveChanges();
            }
        }
    }
}
