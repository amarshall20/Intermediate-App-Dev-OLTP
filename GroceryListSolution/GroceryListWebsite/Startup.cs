using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GroceryListWebsite.Startup))]
namespace GroceryListWebsite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
