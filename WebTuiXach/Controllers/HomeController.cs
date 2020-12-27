using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using WebTuiXach.Areas.Admin.Common;
using WebTuiXach.Models;

namespace WebTuiXach.Controllers
{
    public class HomeController : Controller
    {
        shoptuixachEntities db = new shoptuixachEntities();
        public ActionResult Index(int? page)
        {
            var count = (CartCount)Session["count"];
            if (count != null)
                ViewBag.cartCount = count.count;
            else
                ViewBag.cartCount = 0;
            int pageProduct = 8;
            int pageNumber = (page ?? 1);
            var data = db.products.OrderByDescending(x => x.price).ToPagedList(pageNumber, pageProduct);
            return View(data);
        }

        public ActionResult loadProductById(int id, int? page)
        {
            var count = (CartCount)Session["count"];
            if (count != null)
                ViewBag.cartCount = count.count;
            else
                ViewBag.cartCount = 0;
            int pageProduct = 8;
            int pageNumber = (page ?? 1);
            var cate = db.categories.FirstOrDefault(x => x.id == id);
            if (cate == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            var data = db.products.Where(x => x.category.id == id).OrderByDescending(x => x.price).ToPagedList(pageNumber, pageProduct);
            if (data.Count == 0)
            {
                ViewBag.message = "Does not have Product right here";
            }

            return View(data);
        }

        public ActionResult loadDetailsProduct(int id)
        {
            var count = (CartCount)Session["count"];
            if (count != null)
                ViewBag.cartCount = count.count;
            else
                ViewBag.cartCount = 0;
            var data = db.products.Find(id);
            return View(data);
        }

        [HttpPost]
        public ActionResult findProductByName(FormCollection f, int? page)
        {
            string name = f["product-name"].ToString();
            if (!string.IsNullOrEmpty(name))
            {
                int pageProduct = 8;
                int pageNumber = (page ?? 1);
                var model = db.products.Where(x => x.name.Contains(name)).OrderByDescending(x => x.price).ToPagedList(pageNumber, pageProduct);
                return View(model);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
    }
}