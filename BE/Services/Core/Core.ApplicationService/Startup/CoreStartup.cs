using Core.ApplicationService.CoreModule.Abstracts;
using Core.ApplicationService.CoreModule.Implements;
using Core.Infrastructure;
using Microsoft.AspNetCore.Builder;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Shared.Constant.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.ApplicationService.Startup
{
    public static class CoreStartup
    {
        public static void ConfigureCore(this WebApplicationBuilder builder, string? assemblyName)
        {
            builder.Services.AddDbContext<CoreDbContext>(
                options =>
                {
                    options.UseSqlServer(
                        builder.Configuration.GetConnectionString("Default"),
                        options =>
                        {
                            options.MigrationsAssembly(assemblyName);
                            options.MigrationsHistoryTable(
                                DbSchema.TableMigrationsHistory,
                                DbSchema.Core
                            );
                        }
                    );
                },
                ServiceLifetime.Scoped
            );

            builder.Services.AddScoped<ICoreService, CoreService>();
        }
    }
}
