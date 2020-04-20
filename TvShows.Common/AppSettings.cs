using System;
using System.Collections.Generic;
using System.Text;

namespace TvShows.Common
{
    /// <summary>
    /// Main access to the Application configuration
    /// </summary>
    public class AppSettings
    {
        public string SecretKey { get; set; }
        public int LifeTime { get; set; }
        public string StorageConnectionString { get; set; }
    }
}
