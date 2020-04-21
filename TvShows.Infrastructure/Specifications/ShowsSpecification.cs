using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using TvShows.Common.Data;
using TvShows.Infrastructure.Entities;

namespace TvShows.Infrastructure.Specifications
{
    public class ShowsSpecification : Specification<Shows>
    {
        public string Keywords { get; set; }
        public string Language { get; set; }
        public string Genre { get; set; }
        public string Channel { get; set; }
        public TimeSpan StartScheduleTime { get; set; }
        public TimeSpan EndScheduleTime { get; set; }

        public override Expression<Func<Shows, bool>> ToExpression()
        {
            Expression<Func<Shows, bool>> expression = s => true;

            if (!string.IsNullOrEmpty(Keywords))
            {
                expression.And(s => s.Name.Contains(Keywords));
            }

            if (!string.IsNullOrEmpty(Language))
            {
                expression.And(s => s.Language.Contains(Language));
            }

            if (!string.IsNullOrEmpty(Genre))
            {
                expression.And(s => s.Genres.Contains(Genre));
            }

            if (!string.IsNullOrEmpty(Channel))
            {
                expression.And(s => s.Channel.Contains(Channel));
            }

            if (StartScheduleTime != TimeSpan.Zero && EndScheduleTime != TimeSpan.Zero)
            {
                expression.And(s => s.ScheduleTime >= StartScheduleTime && s.ScheduleTime <= EndScheduleTime);
            }

            return expression;
        }
    }
}
