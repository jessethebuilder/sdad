ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
# require 'rspec/autorun'
require 'factory_girl_rails'
Rails.backtrace_cleaner.remove_silencers!
# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require 'capybara/poltergeist'
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {debug: true})
end
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  
  config.include FactoryGirl::Syntax::Methods
  config.include ActionView::Helpers::NumberHelper

  # config.require 'database_cleaner'
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :deletion
  end
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  
  # config.after(:each) do
    # if Rails.env.test? || Rails.env.cucumber?
      # FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
    # end 
  # end


  # config.include RequestSpecHelper

end