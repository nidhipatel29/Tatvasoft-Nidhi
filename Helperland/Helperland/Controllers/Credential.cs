using Helperland.Data;
using Helperland.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Helperland.Controllers
{
    public class Credential : Controller
    {
        private readonly HelperlandContext _helperlandcontext;
        public Credential(HelperlandContext helperlandContext) 
        {
            _helperlandcontext = helperlandContext;
        }
        public IActionResult UserRegistration()
        {
            User user = new User();
            return View(user);
        }
    }
}
