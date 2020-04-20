using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
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
            var response = await Services.UsersService.CreateUserAsync(user);
            if (!response.Success)
                return BadRequest(response);

            return Ok(response);
        }

        [HttpPost("login")]
        public async Task<IActionResult> LoginAsync([FromBody] Users user)
        {
            var response = await Services.UsersService.LoginAsync(user.UserName, user.Password);
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