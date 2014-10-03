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
  s.description = "Implements a permissions system for Rails api endpoints and devise users..."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "devise"

  s.add_development_dependency "sqlite3"
end
