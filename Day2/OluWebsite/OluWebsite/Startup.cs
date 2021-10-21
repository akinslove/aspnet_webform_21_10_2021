using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OluWebsite.Startup))]
namespace OluWebsite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
