require 'rubygems'
require "selenium-webdriver"
require 'cucumber'
require 'test/unit/assertions'
World(Test::Unit::Assertions)


Before do
  @driver = Selenium::WebDriver.for :firefox
end

After do |scenario|
  
  if scenario.failed?
    screenshot = "faile_scenario_screenshot.png"
    @driver.save_screenshot(screenshot)
    embed(screenshot, "image/png")
  end  
    
  @driver.quit
end