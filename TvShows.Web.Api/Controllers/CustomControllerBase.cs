using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TvShows.Services;

namespace TvShows.Web.Api.Controllers
{
    public class CustomControllerBase : ControllerBase
    {
        public CustomControllerBase(IServiceFactory serviceFactory)
        {
            Services = serviceFactory;
        }

        protected IServiceFactory Services { get; }

        protected IEnumerable<Claim> UserData
        {
            get
            {
                var identity = (ClaimsIdentity)User.Identity;
                IEnumerable<Claim> claims = identity.Claims;
                return claims;
            }
        }

        protected string GetUserDataByType(string type)
        {
            var data = UserData.Where(c => c.Type == type).Select(c => c.Value).SingleOrDefault();
            return data;
        }

        protected long CurrentUserId
        {
            get
            {
                return Convert.ToInt64(GetUserDataByType(ClaimTypes.NameIdentifier.ToString()));
            }
        }
    }
}
