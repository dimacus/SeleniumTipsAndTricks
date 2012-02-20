require 'rubygems'
require "selenium-webdriver"
require 'cucumber'
require 'test/unit/assertions'
World(Test::Unit::Assertions)

require 'headless'
headless = Headless.new(:display => "1")
headless.start

Before do
  headless.video.start_capture
  @driver = Selenium::WebDriver.for :firefox
end

After do |scenario|
  
  if scenario.failed?
    video = "#{scenario.name.split.join('_')}.mov"
    headless.video.stop_and_save(video)
  else
    headless.video.stop_and_discard
  end  
      
  @driver.quit
end

at_exit do
  headless.destroy
end