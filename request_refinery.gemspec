$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "request_refinery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "request_refinery"
  s.version     = RequestRefinery::VERSION
  s.authors     = ["Nathan Hanna"]
  s.email       = ["jnathanhdev@gmail.com"]
  s.homepage    = "https://github.com/jnathanh/request_refinery"
  s.summary     = "Implements a permissions system for Rails api endpoints and devise users"
  s.description = "Creates the following tables:
                      Users
                      Roles
                      Permissions
                      ControllerFilters
                    Implements a devise authentication strategy already configured.
                    Makes available an 'authorized_to? method in application controller that returns true if the users permissions match the given permissions/list of permissions.
                    Implements whitelisting of all requests.  Every http request needs to have an associated ControllerFilter.  If the filter exists, then the current_user's permissions must satisfy the permissions required by the filter."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"
  s.add_dependency "devise"
  s.add_dependency "railties"

  s.add_development_dependency "sqlite3"
end
