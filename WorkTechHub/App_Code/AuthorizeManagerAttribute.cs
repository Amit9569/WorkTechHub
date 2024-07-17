using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WorkTechHub.App_Code
{
    public class AuthorizeManagerAttribute:AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            bool IsValidUser;
            if (httpContext.Session["AdminId"] == null)
                IsValidUser = false;
            else
                IsValidUser = true;
            return IsValidUser;
        }
        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { action = "Login", Controller = "General" }));
        }
    }
}