using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GroceryList.Data.POCOs
{
    public class PickList
    {
        public int OrderListID { get; set; }
        public string ProductDescription { get; set; }
        public double Quantity { get; set; }
        public string Comment { get; set; }
        public double? QuantityPicked { get; set; }
        public string PickIssue { get; set; }
    }
}
