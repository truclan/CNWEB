using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTuiXach.Models;

namespace WebTuiXach.Areas.Admin.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Admin/Category
        shoptuixachEntities _dbContext = new shoptuixachEntities();
        public ActionResult Index()
        {
            var model = _dbContext.categories.ToList();
            return View(model);
        }

        [HttpGet]
        public ActionResult addCategory()
        {
            return View();
        }

        [HttpGet]
        public ActionResult editCategory(int id)
        {
            var model = _dbContext.categories.Find(id);
            return View(model);
        }
        
        [HttpGet]
        public ActionResult deleteCategory(int id)
        {
            if(id > 0)
            {
                var data = _dbContext.categories.Find(id);
                _dbContext.categories.Remove(data);
                _dbContext.SaveChanges();
                return RedirectToAction("Index", "Category");
            }

            return RedirectToAction("Index", "Category");
        }

        [HttpPost]
        public ActionResult addOrEdit(category model, int? id)
        {
            
            if(model != null && id > 0)
            {
                var obj = _dbContext.categories.Find(id);
                obj.name = model.name;
                _dbContext.SaveChanges();
                return RedirectToAction("Index", "Category");
            }
            else{
                var obj = new category();
                obj.name = model.name;
                _dbContext.categories.Add(obj);
                _dbContext.SaveChanges();
                return RedirectToAction("Index", "Category");
            }
        }
    }
}