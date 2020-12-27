using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebTuiXach.Models;
using WebTuiXach.Areas.Admin.Common;

namespace WebTuiXach.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        shoptuixachEntities db = new shoptuixachEntities();
        public ActionResult Index()
        {
            if(Session["cart"] == null)
            {
                return View();
            }
            
            List<CartModel> listcart = getListCart();
            var count = (CartCount)Session["count"];
            if (count != null)
                ViewBag.cartCount = count.count;
            else
                ViewBag.cartCount = 0;
            
            return View(listcart);
        }

        public List<CartModel> getListCart()
        {
            var listCart = Session["cart"] as List<CartModel>;
            if(listCart == null)
            {
                listCart = new List<CartModel>();
                Session["cart"] = listCart;
            }
            
            return listCart;
        }

        public ActionResult addCart(int id)
        {
            var checkExist = db.products.FirstOrDefault(x => x.id == id);
            if(checkExist == null)
            {
                Response.StatusCode = 404;
                return null;
            }


            List<CartModel> list = getListCart();

            CartModel obj = list.FirstOrDefault(x => x.id == id);

            

            if (obj == null)
            {
                obj = new CartModel(id);
                list.Add(obj);
                var cartCount = new CartCount();
                cartCount.count = list.Count();
                Session.Add("count", cartCount);
                return RedirectToAction("Index", "Cart");
            }
            else
            {
                obj.quantity++;
                return RedirectToAction("Index", "Cart");
            }
        }

        [HttpPost]
        public ActionResult updateCart(int id, int quantity)
        {
            List<CartModel> list = Session["cart"] as List<CartModel>;
            CartModel obj = list.Where(x => x.id == id).FirstOrDefault();
            if(obj != null)
            {
                obj.quantity = quantity;
                return RedirectToAction("Index", "Cart");
            }
            return RedirectToAction("Index", "Cart");
        }

        [HttpGet]
        public ActionResult removeCart(int id)
        {
            List<CartModel> list = Session["cart"] as List<CartModel>;
            CartModel obj = list.Where(x => x.id == id).SingleOrDefault();
            if(obj != null)
            {
                list.Remove(obj);
                return RedirectToAction("Index", "Cart");
            }
            return RedirectToAction("Index", "Cart");
        }

        [HttpPost]
        public ActionResult createBill(cart model)
        {
            if(model != null)
            {
                List<CartModel> list = getListCart();
                var cart = new cart();
                cart.customerName = model.customerName;
                cart.phone = model.phone;
                cart.email = model.email;
                cart.address = model.address;
                cart.status = false;
                db.carts.Add(cart);
                db.SaveChanges();

                var CartId = cart.id;
                var cartDetail = new cart_detail();
                foreach(var item in list)
                {
                    cartDetail.id_cart = CartId;
                    cartDetail.quantity = item.quantity;
                    cartDetail.id_product = item.id;
                    db.cart_detail.Add(cartDetail);
                    var product = db.products.Where(x => x.id == item.id).SingleOrDefault();
                    product.quantity -= item.quantity;
                    if(product.quantity < 0)
                    {
                        product.quantity = 0;
                    }
                    db.SaveChanges();       
                    
                }

                Session.Clear();
                ViewBag.message = "Thêm thành công!";
                return RedirectToAction("Index", "Cart");                
            }
            else
            {
                ViewBag.message = "Đã xảy ra lỗi, vui lòng thử lại";
                return RedirectToAction("Index", "Cart");
            }
        }

    }
}