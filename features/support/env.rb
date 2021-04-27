# frozen_string_literal: true

require 'capybara/cucumber'
require 'dotenv/load'
require 'require_all'
require 'rspec/expectations'
require 'selenium-webdriver'
require 'site_prism'

require_all 'lib'
require_all 'page_objects/sections'
require_all 'page_objects/pages'
require_all 'models'

def options
  Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000 --headless])
end

Capybara.default_driver = :selenium
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Before do
  Capybara.page.driver.browser.manage.window.maximize
end

After do
  # setting Capybara driver to reset sessions after all tests are done
  Capybara.reset_sessions!
end
