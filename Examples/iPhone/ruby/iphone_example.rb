require 'rubygems'
require 'sinatra'
require "selenium-webdriver"

require 'sim_launcher'

begin
  simulator = SimLauncher::DirectClient.for_iphone_app( Dir.pwd + '/../iphonedriver/iWebDriver.app', '4.3' )
  simulator.relaunch()

  # see if iWebDriver is loaded(contact the host)
  # retry a few times just incase
  connected = false
  (0..2).each do
    begin
      Net::HTTP.new("localhost", 3005).start
      connected = true
      break
    rescue
      # sleep for two seconds
      sleep(2)
    end
  end

  unless connected
    raise 'Could not launch iPhone webdriver'
  end


  driver = Selenium::WebDriver.for :remote, :url => "http://localhost:3005/hub", :desired_capabilities => :iphone

  driver.navigate.to "http://wwww.groupon.com"
  driver.find_element(:link, "No thanks, continue to site.").click
  driver.find_element(:id, "buy").click
  sleep 10
ensure
  driver.quit
  `/usr/bin/osascript -e 'application "iPhone Simulator" quit'`
end

