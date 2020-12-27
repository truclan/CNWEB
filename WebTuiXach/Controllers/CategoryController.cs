using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTuiXach.Models;

namespace WebTuiXach.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        shoptuixachEntities db = new shoptuixachEntities();
        public ActionResult Index()
        {
            var model = db.categories.ToList();
            return View(model);
        }
    }
}