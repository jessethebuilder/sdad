$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sdad/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sdad"
  s.version     = Sdad::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jesse@anysoft.us"]
  s.homepage    = "http://anysoft.us"
  s.summary     = "SaveDraftArchiveDelte"
  s.description = "Save, Draft, Archive, or Delete an ActiveRecord object."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
  
  s.test_files = Dir["spec/**/*"]
end
