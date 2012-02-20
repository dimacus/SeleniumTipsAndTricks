

Given /^I am on groupon\.com$/ do
  @driver.navigate.to "http://www.groupon.com/"
  sleep 5
end

Then /^I attach it to HTML report$/ do
  embed("screenshot.png", "image/png")
end

Given /^I navigate to google$/ do
  @driver.navigate.to "http://www.google.com"
  sleep 5
end

Given /^this scenario will fail on purpose$/ do
  assert_equal(true, false)
end

