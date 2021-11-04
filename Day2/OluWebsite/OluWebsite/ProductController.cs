using OluWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace OluWebsite
{
    public class ProductController : ApiController
    {
        Product[] products = new Product[]
         {
            new Product {ProductId=1, Pname = "PC", Pdescription="Pc best", Pprice=567M, Stock=4},
            new Product {ProductId=2, Pname = "Car", Pdescription="The car", Pprice=5.67M, Stock=3},
            new Product {ProductId=3, Pname = "Toyota", Pdescription="Great descriptiom", Pprice=89.90M, Stock=10},
            new Product {ProductId=4, Pname = "Stocks", Pdescription="Pt", Pprice=90M, Stock=40},
         };

        // GET: api/<ProductController>
        public IEnumerable<Product> Get()
        {
            return products;
        }

        // GET api/<ProductController>/5
        public Product Get(int id)
        {
            var product = products.FirstOrDefault(p => p.ProductId == id);

            if (product == null)
            {
                throw new Exception("Error: " + HttpStatusCode.NotFound);
            }
            return product;
        }

        //// POST api/<controller>
        //public void Post([FromBody] string value)
        //{
        //}

        //// PUT api/<controller>/5
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        //// DELETE api/<controller>/5
        //public void Delete(int id)
        //{
        //}
    }
}