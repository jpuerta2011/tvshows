using System;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using TvShows.Common.Exceptions;

// ReSharper disable once IdentifierTypo
namespace TvShows.Web.Api.Middlewares
{
    public class CustomExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<CustomExceptionMiddleware> _loggerFactory;

        public CustomExceptionMiddleware(RequestDelegate next, ILogger<CustomExceptionMiddleware> loggerFactory)
        {
            _next = next;
            _loggerFactory = loggerFactory;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next.Invoke(context);
            }
            catch (Exception ex)
            {

                await HandleExceptionAsync(context, ex);
            }
        }

        private async Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            // Error unique code generator
            var errorUniqueCode = $"{DateTime.Now:yyyyMMddHmmss}_{Guid.NewGuid():N}";

            var response = context.Response;
            var statusCode = (int)HttpStatusCode.InternalServerError;
            var message = "Unexpected Error";
            var description = "UnexpectedError";

            if (exception is BaseCustomException customException)
            {
                message = customException.Message;
                description = customException.Description;
                statusCode = customException.Code;
            }

            response.ContentType = "application/json";
            response.StatusCode = statusCode;

            // Log the error
            _loggerFactory.LogError(exception, $"##{errorUniqueCode}##-{exception.Message}");

            await response.WriteAsync(JsonConvert.SerializeObject(new
            {
                Message = message,
                Description = description,
                InternalErrorUniqueCode = errorUniqueCode
            }));
        }
    }
}
