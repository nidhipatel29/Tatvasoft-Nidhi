using Helperland.Data;
using Helperland.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace Helperland.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly HelperlandContext _helperlandcontext =new HelperlandContext();
        //public HomeController(HelperlandContext helperlandContext)
        //{
        //    _helperlandcontext = helperlandContext;
        //}

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            User user = new User();
            return View(user);
        }

        public ViewResult Price()
        {
            return View();
        }

        public ViewResult Faq()
        {
            return View();
        }

        public ViewResult AboutUs()
        {
            return View();
        }

        public ViewResult ContactUs()
        {
            return View();
        }

        public IActionResult UserRegistration()
        {
            User user = new User();
            return View(user);
        }

        [HttpPost]

        public IActionResult UserRegistration(User user)
        {
            if (_helperlandcontext.Users.Where(x => x.Email == user.Email).Count() == 0 && _helperlandcontext.Users.Where(x => x.Mobile == user.Mobile).Count()==0)
            {
                user.UserTypeId = 1;
                user.CreatedDate = DateTime.Now;
                user.ModifiedDate = DateTime.Now;
                user.IsRegisteredUser = true;
                user.ModifiedBy = 123;

                _helperlandcontext.Users.Add(user);
                _helperlandcontext.SaveChanges();
                return RedirectToAction("Index");
            }

            else
            {
                ViewBag.message = "User already exists";
            }
            return View();
        }

        [HttpPost]
        public IActionResult Index(User user)
        {
            if (_helperlandcontext.Users.Where(x => x.Email == user.Email).Count() == 0 && _helperlandcontext.Users.Where(x => x.Password == user.Password).Count() == 0)
            {
                ViewBag.Message = "Enter valid Email Id";
            }
            else
            {
                ViewBag.Message = "Login Successfully";
                return RedirectToAction("ContactUs");
            }
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
