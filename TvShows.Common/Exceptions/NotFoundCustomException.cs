using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace TvShows.Common.Exceptions
{
    public class NotFoundCustomException : BaseCustomException
    {
        public NotFoundCustomException(string message, string description) : base(message, description, (int)HttpStatusCode.NotFound)
        {
        }
    }
}
