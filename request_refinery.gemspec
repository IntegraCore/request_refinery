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
  s.summary     = "Instant users with fully customizeable access control and controller security for Rails 4"

  s.description = "This gem takes any rails 4 app and adds users/authentication (a devise implementation), access control (specify who has access to specific resources), and controller security (specify who has access to specific http methods, controllers, and controller methods).  All tables are fully namespaced and will not interfere with existing users, permissions, or roles tables."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4"
  s.add_dependency "devise"
  s.add_dependency "railties"

  s.add_development_dependency "sqlite3"
end
