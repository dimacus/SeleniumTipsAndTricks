Selenium Tips And Tricks Presentation
=====================================

Given by Dima Kovalenko at Selenium Camp 2012
http://seleniumcamp.com/

### Getting Started

You will need ruby, git for starters.

```bash
git clone git@github.com:dimacus/SeleniumTipsAndTricks.git
cd SeleniumTipsAndTricks
gem install bundler
bundle install
```
You might need to execute these commands with sudo on your local machine.

### Ruby examples

To run an example, you need to make sure you have all the gems installed and have Firefox 3.6 or higher installed.

change directory into the example folder you wish to use, and run


```bash
ruby example_file_name.rb
```

### Cucumber Examples
To execute cucumber examples, you will need to have all gems installed.

cd into the cucumber example directory, and run following command

```bash
cucumber features
```


### Sauce example
You will need to have a saucelabs free or payed account
http://saucelabs.com/pricing

After you created an account, you will need to modify sauce_example.rb and add your sauce username and sauce api key

```ruby
sauce_params[:username] = nil
sauce_params[:access_key] = nil
```

### iPhone Example

You will need to have iPhone simulator installed to use this example. This tutorial was put together on a Mac, so there is no guarantee that it will work on windows :(

And I don't have a windows box available to test this on.

### Movie Example

Currently the movie example only works on linux. I'm working on some tutorials for Windows and Mac.

On linux, it is assumed that XVFB and ffmpeg are installed. Please seem the headless gem for more info https://github.com/leonid-shevtsov/headless