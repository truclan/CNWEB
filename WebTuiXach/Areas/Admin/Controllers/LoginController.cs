using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTuiXach.Models;
using WebTuiXach.Areas.Admin.Common;

namespace WebTuiXach.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        shoptuixachEntities _dbContext = new shoptuixachEntities();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult checkLog(string username, string password)
        {
            if(!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                var model = _dbContext.accounts.Where(x => x.username.Equals(username) && x.password.Equals(password)).SingleOrDefault();
                var userLogin = new userLogin();
                
                userLogin.perId = model.id_permission;
                Session.Add("userId", userLogin);

                ViewBag.name = model.fullname;
                
                if(model.id_permission > 0)
                {
                    return RedirectToAction("Index", "HomeAdmin");
                }

            }
            return View();
        }
    }
}