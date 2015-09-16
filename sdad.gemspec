$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sdad/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sdad"
  s.version     = Sdad::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jessethebuilder@yahoo.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Sdad."
  s.description = "TODO: Description of Sdad."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
  
  s.test_files = Dir["spec/**/*"]
end
