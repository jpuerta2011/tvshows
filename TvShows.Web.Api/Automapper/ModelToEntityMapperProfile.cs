using AutoMapper;
using Entities = TvShows.Infrastructure.Entities;
using Models = TvShows.Services.Models;

namespace TvShows.Web.Api.Automapper
{
    public class ModelToEntityMapperProfile : Profile
    {
        public ModelToEntityMapperProfile()
        {
            CreateMap<Models.Users, Entities.Users>()
                .ForMember(d => d.Role, opt => opt.Ignore())
                .ForMember(d => d.Password, opt => opt.Ignore());

            CreateMap<Models.Roles, Entities.Roles>();
        }
    }
}
