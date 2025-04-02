using Core.Infrastructure;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.ApplicationService.Common
{
    public abstract class CoreServiceBase
    {
        protected readonly ILogger _logger;
        protected readonly CoreDbContext _dbContext;

        protected CoreServiceBase(ILogger logger, CoreDbContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
        }
    }
}
