
require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'mail'

$otp = ""
# driver = Selenium::WebDriver.for :chrome

Given('user open amazon website for negative case') do
  driver.navigate.to 'https://www.amazon.com/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&'         # direct to site
end

When(/^user input invalid email ([^"]*)$/) do |email|
  driver.find_element(:id, 'ap_email').send_keys email
  driver.find_element(:class, 'a-button-input').click
end

When(/^user input invalid password (.*) and click sign in$/) do |password|
  sleep(4)
  driver.find_element(:id, 'ap_password').send_keys password
  driver.find_element(:class, 'a-button-input').click
end

Then('validate if account not found message appear') do
  message = driver.find_element(:class, 'a-list-item').text
  message.should == "We cannot find an account with that email address"
end

Then('validate if password is incorrect message appear') do
  message = driver.find_element(:class, 'a-list-item').text
  message.should == "Your password is incorrect"
end
