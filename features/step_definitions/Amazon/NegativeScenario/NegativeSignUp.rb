require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'mail'

$otp = ""
# driver = Selenium::WebDriver.for :chrome

Given('user open amazon website for negative sign up') do
  driver.navigate.to 'https://www.amazon.com/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&'         # direct to site
end

And('user click button create acccount for negative sign up') do
  driver.find_element(:id, 'createAccountSubmit').click
  sleep(5)

end

When('user input name, email, and invalid password') do
  dateTime = Time.now.strftime("%Y%m%d%H%M%S").to_s
  driver.find_element(:id, 'ap_customer_name').send_keys "yudis"
  driver.find_element(:id, 'ap_email').send_keys "yudistira96@gmail.com"
  driver.find_element(:id, 'ap_password').send_keys "uiui"
  driver.find_element(:id, 'ap_password_check').send_keys "huy&"
  driver.find_element(:id, 'continue').click
end

Then(/^validate password must match message appear$/) do
  message = driver.find_element(:id, 'auth-password-invalid-password-alert').text
  message.should == "Passwords must be at least 6 characters."
end