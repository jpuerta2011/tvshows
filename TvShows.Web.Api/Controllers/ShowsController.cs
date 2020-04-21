using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TvShows.Common.Data;
using TvShows.Services;

namespace TvShows.Web.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class ShowsController : CustomControllerBase
    {
        public ShowsController(IServiceFactory serviceFactory) : base(serviceFactory)
        {
        }

        [HttpGet]
        public async Task<IActionResult> Get(string keywords, string language, string genre,
            string channel, string startScheduleTime, string endScheduleTime, string sortField = "ShowId",
            OrderByType sortType = OrderByType.Ascending , int count = 50, int page = 1)
        {
            var response = await Services.ShowsService.GetShowsByFiltersAsync(count, page, keywords, language, genre,
                channel, startScheduleTime, endScheduleTime, sortField, sortType);
            return Ok(response);
        }

        [Authorize(Roles = "Administrators")]
        [HttpPost("sync")]
        public async Task SyncShows()
        {
            await Services.ShowsService.SyncExternalShowsAsync();
        }
    }
}