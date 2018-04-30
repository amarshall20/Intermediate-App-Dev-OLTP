namespace GroceryList.Data.Entities
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    //using System.Data.Entity.Spatial;

    public partial class Picker
    {
        public int PickerID { get; set; }

        [Required(ErrorMessage = "LastName is required.")]
        [StringLength(35, ErrorMessage = "LastName has a maximum length of 35 characters.")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "FirstName is required.")]
        [StringLength(25, ErrorMessage = "FirstName has a maximum length of 25 characters.")]
        public string FirstName { get; set; }

        public bool Active { get; set; }

        public int StoreID { get; set; }

        public virtual Store Store { get; set; }
        [NotMapped]
        public string FullName
        {
            get
            {
                return LastName + ", " + FirstName;
            }
        }
    }
}
