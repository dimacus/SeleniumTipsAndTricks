require 'rubygems'
require "selenium-webdriver"
require 'pdf_parser'

profile = Selenium::WebDriver::Firefox::Profile.new

#Setup download preferences to auto download PDFs and other aproved files directly to
#Specified dir which does not have to already exist
download_dir = "#{Dir.pwd}/download_dir_from_programatic_profile"
profile["browser.helperApps.neverAsk.saveToDisk"] = "text/plain,application/pdf,application/zip,text/csv"
profile["browser.download.dir"]                   = download_dir
profile["browser.download.lastDir"]               = download_dir
profile["browser.download.folderList"]            = 2


#Add Firebug extension to the profile
firebug_extension = "#{Dir.pwd}/extensions/firebug@software.joehewitt.com.xpi"
if File.exists?(firebug_extension) 
  profile.add_extension(firebug_extension) 
  profile["extensions.firebug.currentVersion"] = "1.9.1"
end


@driver = Selenium::WebDriver.for :firefox, {:profile => profile}


begin
    
  @driver.navigate.to "http://seleniumhq.org/docs/"
  
  @driver.find_element(:link, "Offline version (pdf)").click
  
  begin
    puts "Waiting for file to download"
    sleep 1
  end while File.exist?("#{download_dir}/Selenium_Documentation.pdf.part")
  
  puts "File downloaded"
  
  puts "Parsing the PDF file, it is very large and will take a long time"
  
  receiver = PageTextReceiver.new
  pdf = PDF::Reader.file("#{download_dir}/Selenium_Documentation.pdf", receiver)

  puts "\n\nFirst page of the PDF is:\n\n"
  puts receiver.content[0].inspect
  
ensure
  @driver.quit
end