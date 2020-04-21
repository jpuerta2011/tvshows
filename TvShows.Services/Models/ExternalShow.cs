using System;
using System.Collections.Generic;
using System.Text;

namespace TvShows.Services.Models
{
    public class ExternalShow
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Language { get; set; }
        public string[] Genres { get; set; }
        public ScheduleTime Schedule { get; set; }
        public Channel Network { get; set; }
        public Channel WebChannel { get; set; }
        public Image Image { get; set; }
    }

    public class ScheduleTime
    {
        public string Time { get; set; }
        public string[] Days { get; set; }
    }

    public class Channel
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }

    public class Image
    {
        public string Medium { get; set; }
        public string Original { get; set; }
    }
}
