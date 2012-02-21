require 'rubygems'
require "selenium-webdriver"
require 'sauce'


sauce_params = {}

sauce_params[:browser] = "iexplore"
sauce_params[:browser_version] = "9."
sauce_params[:job_name] = "Job with timestamp: #{Time.now.strftime('%s')}"
sauce_params[:os] = "Windows 2008"
sauce_params[:username] = nil
sauce_params[:access_key] = nil

if sauce_params[:username].nil? or sauce_params[:access_key].nil?
  puts "Plese create a saucelabs account and provide it in the config"
  exit
end


@driver = Sauce::Selenium2.new(sauce_params)


begin
  
  @driver.navigate.to "http://groupon.com/subscriptions/new?division_p=roanoke"
  @driver.find_element(:xpath, "//option[@value='chicago']").click
  @driver.find_element(:link, "Continue").click
  sleep 3
  @driver.find_element(:id, "subscription_email_address").send_keys("foo@bar.com")
  @driver.find_element(:id, "step_two").click
  sleep 7
  
ensure
  @driver.stop
end
