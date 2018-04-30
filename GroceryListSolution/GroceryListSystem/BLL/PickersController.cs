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
    public class PickersController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Picker> Pickers_List()
        {
            using (var context = new GroceryListContext())
            {
                //return all pickers in a list -- return only the pickers that work at the store of the order ID

                return context.Pickers.ToList();
            }
        }
    }
}
