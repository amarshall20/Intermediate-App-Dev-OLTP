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
    public class ProductController
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Product> Products_List()
        {
            using (var context = new GroceryListContext())
            {
                return context.Products.OrderBy(x => x.Description).ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public Product Products_Get(int productid)
        {
            using (var context = new GroceryListContext())
            {
                return context.Products.Find(productid);
            }
        }

        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public List<Product> Products_GetByCategoryID(int categoryid)
        {
            using (var context = new GroceryListContext())
            {
                return context.Products.Where(x => x.CategoryID == categoryid).Select(x => x).ToList();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Insert, false)]
        public void Products_Add(Product item)
        {
            using (var context = new GroceryListContext())
            {
                context.Products.Add(item);
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Update, false)]
        public void Products_Update(Product item)
        {
            using (var context = new GroceryListContext())
            {
                context.Entry(item).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        [DataObjectMethod(DataObjectMethodType.Delete, false)]
        public void Products_Delete(Product p)
        {
            Products_Delete(p.ProductID);
        }
        public void Products_Delete(int productid)
        {
            using (var context = new GroceryListContext())
            {
                var existing = context.Products.Find(productid);
                if (existing == null)
                {
                    throw new Exception("Product does not exist on file.");
                }
                context.Products.Remove(existing);
                context.SaveChanges();
            }
        }
    }
}
