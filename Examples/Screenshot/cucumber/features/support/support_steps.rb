
Given /^I am on groupon\.com$/ do
  @driver.navigate.to "http://www.groupon.com/"
end

Then /^I take a screenshot$/ do
  @driver.save_screenshot("screenshot.png")
end

Then /^I attach it to HTML report$/ do
  embed("screenshot.png", "image/png")
end

Given /^I navigatoe to google\.com$/ do
  @driver.navigate.to "http://www.google.com"
end

Given /^this scenario will fail on purpose$/ do
  assert_equal(true, false)
end

