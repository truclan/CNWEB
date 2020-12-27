using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTuiXach.Models;
using WebTuiXach.Areas.Admin.Common;

namespace WebTuiXach.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        // GET: Admin/HomeAdmin
        shoptuixachEntities _dbContext = new shoptuixachEntities();

        public ActionResult Index()
        {
            var obj = (userLogin)Session["userId"];
            if(obj.perId != 0)
            {
                return View();
            }
            else
            {
            return View("Index", "Login");
            }
        }
    }
}