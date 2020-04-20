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
    [Authorize(Roles = "Administrators")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : CustomControllerBase
    {
        public UsersController(IServiceFactory serviceFactory) : base(serviceFactory)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var response = await Services.UsersService.GetUsers();
            return Ok(response);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(long id)
        {
            var response = await Services.UsersService.GetUser(id);
            return Ok(response);
        }

        [HttpPost]
        public async Task<IActionResult> PostAsync([FromBody] Users user)
        {
            var response = await Services.UsersService.CreateUserAsync(user);
            if (!response.Success)
                return BadRequest(response);

            return Ok(response);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutAsync(long id, [FromBody] Users user)
        {
            var response = await Services.UsersService.UpdateUserAsync(id, user);
            if (!response.Success)
                return BadRequest(response);

            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task DeleteAsync(long id)
        {
            await Services.UsersService.DeleteUserAsync(id);
        }
    }
}