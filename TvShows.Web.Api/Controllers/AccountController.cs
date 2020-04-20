using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TvShows.Services;
using TvShows.Services.Models;

namespace TvShows.Web.Api.Controllers
{
    [AllowAnonymous]
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : CustomControllerBase
    {
        public AccountController(IServiceFactory serviceFactory) : base(serviceFactory) { }

        // POST: api/Account
        [HttpPost]
        public async Task<IActionResult> PostAsync([FromBody] Users user)
        {
            var response = await Services.SecurityService.CreateUserAsync(user);
            if (!response.Success)
                return BadRequest(response);

            return Ok(response);
        }

        [HttpPost("login")]
        public async Task<IActionResult> LoginAsync([FromBody] Users user)
        {
            var response = await Services.SecurityService.LoginAsync(user.UserName, user.Password);
            if (!response.Success)
                return BadRequest(response);

            return Ok(response);
        }

    }
}