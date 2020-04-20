using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entities = TvShows.Infrastructure.Entities;
using Models = TvShows.Services.Models;

namespace TvShows.Web.Api.Automapper
{
    public class EntityToModelMapperProfile : Profile
    {
        public EntityToModelMapperProfile()
        {
            CreateMap<Entities.Users, Models.Users>()
                .ForMember(d => d.Password, opt => opt.Ignore())
                .ForMember(d => d.Role, opt => opt.MapFrom(s => s.Role.RoleName));

            CreateMap<Entities.Roles, Models.Roles>();
        }
    }
}
