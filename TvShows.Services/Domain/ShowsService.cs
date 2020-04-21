using System;
using System.Collections.Generic;
using System.Globalization;
using System.Net;
using System.Threading.Tasks;
using AutoMapper;
using Microsoft.EntityFrameworkCore.Internal;
using Newtonsoft.Json;
using RestSharp;
using TvShows.Common;
using TvShows.Common.Data;
using TvShows.Infrastructure;
using TvShows.Infrastructure.Entities;
using TvShows.Infrastructure.Specifications;
using TvShows.Services.Base;
using TvShows.Services.Models;

namespace TvShows.Services.Domain
{
    public interface IShowsService : IService
    {
        Task<IEnumerable<Show>> GetShowsByFiltersAsync(int count, int page, string keywords, string language,
            string genre, string channel, string startScheduleTime, string endScheduleTime, string sortField,
            OrderByType sortType);

        Task SyncExternalShowsAsync();
    }

    public class ShowsService : Service, IShowsService
    {
        public ShowsService(IRepositoryFactory repositoryFactory, IUnitOfWork unitOfWork, IMapper mapper) : base(repositoryFactory, unitOfWork, mapper)
        {
        }

        public async Task<IEnumerable<Show>> GetShowsByFiltersAsync(int count = 50, int page = 1, string keywords = "",
            string language = "", string genre = "", string channel = "", string startScheduleTime = null, string endScheduleTime = null,
            string sortField = "ShowId", OrderByType sortType = OrderByType.Ascending)
        {
            TimeSpan.TryParseExact(startScheduleTime, @"h\:mm", CultureInfo.InvariantCulture, TimeSpanStyles.None,
                out var startTime);

            TimeSpan.TryParseExact(endScheduleTime, @"h\:mm", CultureInfo.InvariantCulture, TimeSpanStyles.None,
                out var endTime);

            var specification = new ShowsSpecification
            {
                Keywords = keywords,
                Language = language,
                Genre = genre,
                Channel = channel,
                StartScheduleTime = startTime,
                EndScheduleTime = endTime,
                ItemsPerPage = count,
                Page = page
            };

            specification.AddOrderBy(sortField, sortType);

            var shows = await Repositories.ShowsRepository.ListAsync(specification);

            return Mapper.Map<IEnumerable<Show>>(shows);
        }

        /// <summary>
        /// Sync next shows page from TV Maze api
        /// </summary>
        /// <returns></returns>
        public async Task SyncExternalShowsAsync()
        {
            var specification = new ShowsSpecification();
            specification.AddOrderBy("ShowId", OrderByType.Descending);

            var show = await Repositories.ShowsRepository.GetSingleAsync(specification);

            var page = 0;

            if (show != null)
            {
                page = Convert.ToInt32((show.ShowId / 250));
            }

            var requestUrl = $"shows?page={page}";
            var client = new RestClient("http://api.tvmaze.com/");
            var request = new RestRequest(requestUrl, Method.GET);

            var response = await client.ExecuteAsync<IEnumerable<ExternalShow>>(request);
            
            if (response.StatusCode == HttpStatusCode.OK)
            {
                var shows = JsonConvert.DeserializeObject<IList<ExternalShow>>(response.Content);

                foreach (var externalShow in shows)
                {
                    TimeSpan.TryParseExact(externalShow.Schedule?.Time, @"h\:mm", CultureInfo.InvariantCulture, TimeSpanStyles.None,
                        out var endTime);

                    Repositories.ShowsRepository.Save(new Shows
                    {
                        ShowId = externalShow.Id,
                        Name = externalShow.Name,
                        Language = externalShow.Language,
                        Channel = externalShow.WebChannel?.Name ?? externalShow.Network?.Name,
                        Genres = externalShow.Genres?.Join(","),
                        ScheduleTime = endTime,
                        Thumbnail = externalShow.Image?.Original
                    });
                }

                await UnitOfWork.CommitAsync();
            }
        }

    }
}
