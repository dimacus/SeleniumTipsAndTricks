
Feature: Take a screenshot only on a failing test
         Check the env.rb, in the After section for the code


Scenario: Take a screenshot
	Given I am on groupon.com
	And I navigatoe to google.com
	And this scenario will fail on purpose