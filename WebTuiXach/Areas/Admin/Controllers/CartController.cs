using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTuiXach.Models;

namespace WebTuiXach.Areas.Admin.Controllers
{
    public class CartController : Controller
    {
        // GET: Admin/Cart
        shoptuixachEntities db = new shoptuixachEntities();
        public ActionResult Index()
        {
            var model = db.carts.ToList();
            return View(model);
        }

        public ActionResult successCart(int id)
        {
            var model = db.carts.Where(x => x.id == id).SingleOrDefault();
            model.status = true;
            db.SaveChanges();
            return RedirectToAction("Index", "Cart");
        }

        public ActionResult cartDetails(int id)
        {
            var model = db.cart_detail.Where(x => x.id_cart == id).ToList();
            return View(model);
        }

        public ActionResult removeCart(int id)
        {
            var model = db.carts.Where(x => x.id == id).SingleOrDefault();
            db.carts.Remove(model);
            db.SaveChanges();
            return RedirectToAction("Index", "Cart");
        }
    }
}