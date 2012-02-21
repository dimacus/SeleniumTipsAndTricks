require 'rubygems'
require "selenium-webdriver" 

caps = Selenium::WebDriver::Remote::Capabilities.htmlunit(:javascript_enabled => true)
headless = Selenium::WebDriver.for(:remote, :desired_capabilities => caps)


begin
  start_time = Time.now
  
  10.times do
    headless.navigate.to "http://seleniumhq.org/"
    headless.find_element(:link, "Projects").click
    puts headless.current_url
    headless.find_element(:link, "Download").click
    puts headless.current_url
    headless.find_element(:link, "Documentation").click
    puts headless.current_url
    headless.find_element(:link, "Support").click
    puts headless.current_url
    headless.find_element(:link, "About").click
    puts headless.current_url
  end
  
  took = Time.now - start_time
  puts "Headless browser took #{took} seconds"
ensure
  headless.quit
end


firefox = Selenium::WebDriver.for :firefox

begin
  start_time = Time.now
  
  5.times do
    firefox.navigate.to "http://seleniumhq.org/"
    firefox.find_element(:link, "Projects").click
    puts firefox.current_url
    firefox.find_element(:link, "Download").click
    puts firefox.current_url
    firefox.find_element(:link, "Documentation").click
    puts firefox.current_url
    firefox.find_element(:link, "Support").click
    puts firefox.current_url
    firefox.find_element(:link, "About").click
    puts firefox.current_url
  end
  
  took = Time.now - start_time
  puts "Firefox browser took #{took} seconds"
ensure
  firefox.quit
end