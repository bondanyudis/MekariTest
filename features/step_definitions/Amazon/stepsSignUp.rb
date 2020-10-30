
require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'mail'

$otp = ""
driver = Selenium::WebDriver.for :chrome

Given('user open amazon website for sign up') do
  driver.navigate.to 'https://www.amazon.com/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&'         # direct to site
  sleep(10)
end

And('user click button create acccount') do
  driver.find_element(:id, 'createAccountSubmit').click
  sleep(5)

end


When('user input name, email, and password') do
  sleep(4)
  dateTime = Time.now.strftime("%Y%m%d%H%M%S").to_s
  driver.find_element(:id, 'ap_customer_name').send_keys "yudis"
  driver.find_element(:id, 'ap_email').send_keys "yudistira96@gmail.com"
  driver.find_element(:id, 'ap_password').send_keys "YUd1$t1r4sug4nd1"
  driver.find_element(:id, 'ap_password_check').send_keys "YUd1$t1r4sug4nd1"
  sleep(25)
  driver.find_element(:id, 'continue').click
end

And('user go to email to get opt yudistira96@gmail.com and input OTP') do
  # driver.find_element(:name, 'identifier').send_keys "lutfiyahbu@gmail.com"
  # sleep(5)
  # driver.find_element(:class, 'VfPpkd-RLmnJb').click
  # sleep(5)
  # driver.find_element(:name, 'password').send_keys 'Sunanampel36'
  Mail.defaults{
    retriever_method :imap, :address    => "pop.gmail.com",
                     :port       => 993,
                     :user_name  => 'yudistira96@gmail.com',
                     :password   => 'zykkgsekjzcvstml',
                     :enable_ssl => true
  }
  emails = Mail.find(:what => :last, :count => 1,:order => :asc, :from =>  "account-update@amazon.com")
  str1_markerstring = '<p class="otp">'
  str2_markerstring = '<td id="accountSecurity">'
  data1 = emails.to_s
  data = data1.split(str1_markerstring).last.split(str2_markerstring).first
  otp = data.delete("^0-9")

  sleep(4)
  driver.find_element(:name, 'code').send_keys otp
  sleep(4)
  driver.find_element(:class, 'a-button-input').click
  # sleep(4)
  # driver.find_element(:name, 'dcq_question_subjective_1').send_keys "yudistira sugandi"
  # driver.find_element(:class, 'a-button-input').click
end