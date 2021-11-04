using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace OluWebApi.Models
{
    public class Product
    {
        public int ProductId { get; set; }

        public string Pname { get; set; }

        public string Pdescription { get; set; }

        public decimal Pprice { get; set; }

        public int Stock { get; set; }
    }
}
