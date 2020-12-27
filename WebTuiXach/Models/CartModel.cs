using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebTuiXach.Models;

namespace WebTuiXach.Models
{
    public class CartModel
    {
        shoptuixachEntities db = new shoptuixachEntities();
        public int id { get; set; }
        public string name { get; set; }
        public string path { get; set; }
        public int quantity { get; set; }
        public double price { get; set; }
        public double totalPrice { get { return quantity * price; } }

        public CartModel(int id)
        {
            this.id = id;
            product obj = db.products.Where(x => x.id == id).SingleOrDefault();
            this.name = obj.name;
            this.path = obj.path;
            this.price = obj.price;
            this.quantity = 1;            
        }
    }
}