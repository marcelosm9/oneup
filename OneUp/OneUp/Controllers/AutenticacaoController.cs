using OneUp.Models;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace OneUp.Controllers
{
    [AllowAnonymous]
    public class AutenticacaoController : Controller
    {
        [HttpGet]
        public ActionResult Login(string returnUrl)
        {
            var model = new Login()
            {
                ReturnUrl = returnUrl
            };
            return View(model);
        }

        [HttpPost]
        public ActionResult Login(Login model)
        {
            if (!ModelState.IsValid)
            {
                return View();
            } 

            // Apenas para testes
            if (model.Usuario == "marcelo.mendonca" && model.Senha == "123456")
            {
                var identity = new ClaimsIdentity(new[]
                {
                    new Claim(ClaimTypes.Name, "Marcelo"),
                    new Claim(ClaimTypes.Email, "marcelo@oneup.com"),
                    new Claim(ClaimTypes.Country, "Brasil")
                },
                "ApplicationCookie");

                var owinContext = Request.GetOwinContext();
                var auth = owinContext.Authentication;

                auth.SignIn(identity);

                return Redirect(GetRedirectUrl(model.ReturnUrl));

            }

            ModelState.AddModelError("", "Usuário ou senha inválidos");
            return View();
        }

        private string GetRedirectUrl(string returnUrl)
        {
            if (string.IsNullOrEmpty(returnUrl) || Url.IsLocalUrl(returnUrl))
            {
                return Url.Action("Index", "Home");
            }

            return returnUrl;
        }

        public ActionResult SignOut()
        {
            var owinContext = Request.GetOwinContext();
            var auth = owinContext.Authentication;

            auth.SignOut("ApplicationCookie");
            return RedirectToAction("Index", "Home");
        }
    }
}