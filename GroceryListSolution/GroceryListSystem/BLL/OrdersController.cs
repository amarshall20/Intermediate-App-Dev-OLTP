using GroceryList.Data.Entities;
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
    public class OrdersController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Order> Orders_UnDeliveredList()
        {
            using(var context = new GroceryListContext())
            {
                //return all orders in a list which HAVE NOT been picked
                return context.Orders.Where(x => x.Delivery == false).ToList();
            }
        }
    }
}
