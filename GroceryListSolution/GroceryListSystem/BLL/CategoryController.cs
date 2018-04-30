using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using GroceryList.Data.Entities;
using GroceryListSystem.DAL;
using System.ComponentModel;

namespace GroceryListSystem.BLL
{
    [DataObject]
    public class CategoryController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Category> Categories_List()
        {
            using (var context = new GroceryListContext())
            {
                return context.Categories.OrderBy(x => x.Description).ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public Category Categories_Get(int categoryid)
        {
            using (var context = new GroceryListContext())
            {
                return context.Categories.Find(categoryid);
            }
        }
    }
}
