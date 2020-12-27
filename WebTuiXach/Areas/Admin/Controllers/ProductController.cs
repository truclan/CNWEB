using System;   
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTuiXach.Models;
using System.IO;


namespace WebTuiXach.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        // GET: Admin/Product
        shoptuixachEntities _dbContext = new shoptuixachEntities();
        public ActionResult Index()
        {
            var model = _dbContext.products.ToList();
            return View(model);
        }

        [HttpGet]
        public ActionResult addProduct()
        {
            var listCategory = _dbContext.categories.ToList();
            ViewBag.listCate = listCategory;
            return View();
        }

        [HttpGet]
        public ActionResult editProduct(int id)
        {
            var model = _dbContext.products.Find(id);
            var listCategory = _dbContext.categories.ToList();
            ViewBag.listCate = listCategory;
            return View(model);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult addOrEdit(product model, int? id, HttpPostedFileBase files )
        {
            
            if(model != null && id > 0)
            {
                var obj = _dbContext.products.Find(id);
                if(files != null)
                {
                    string path = Path.Combine(Server.MapPath("~/asset/uploads/img/"),
                            Path.GetFileName(files.FileName));
                    files.SaveAs(path);
                    obj.path = files.FileName;                            
                }
                else
                {
                    obj.path = model.path;
                }
                obj.name = model.name;
                obj.price = model.price;
                obj.id_category = model.id_category;
                obj.description = model.description;
                obj.quantity = model.quantity;
                _dbContext.SaveChanges();
            return RedirectToAction("Index", "Product");
            }
            else
            {
                var obj = new product();
                
                if(files != null)
                {
                    string path = Path.Combine(Server.MapPath("~/asset/uploads/img/"),
                            Path.GetFileName(files.FileName));
                    files.SaveAs(path);
                    obj.path = files.FileName;
                }
                else
                {
                    obj.path = model.path;
                }
                obj.name = model.name;
                obj.price = model.price;
                obj.id_category = model.id_category;
                obj.description = model.description;
                obj.quantity = model.quantity;
                _dbContext.products.Add(obj);
                _dbContext.SaveChanges();
                return RedirectToAction("Index", "Product");
            }
        }

        [HttpGet]
        public ActionResult removeProduct(int id)
        {
            if(id > 0)
            {
                var model = _dbContext.products.Find(id);
                _dbContext.products.Remove(model);
                _dbContext.SaveChanges();
                return RedirectToAction("Index", "Product");
            }
            return RedirectToAction("Index", "Product");
        }
    }
}