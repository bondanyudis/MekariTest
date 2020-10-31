require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'mail'

$otp = ""
# driver = Selenium::WebDriver.for :chrome

Given('user open amazon website for sign in') do
  driver.navigate.to 'https://www.amazon.com/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2F%3Fref_%3Dnav_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&'
end

When('user input email yudistira96@gmail.com') do
  sleep(4)
  driver.find_element(:id, 'ap_email').send_keys "yudistira96@gmail.com"
  driver.find_element(:class, 'a-button-input').click

end

And('user input password YUd1$t1r4sug4nd1') do
  driver.find_element(:id, 'ap_password').send_keys "YUd1$t1r4sug4nd1"
end

And('user click Sign in') do
  driver.find_element(:class, 'a-button-input').click

  if driver.page_source.include? "Hello, yudis"
    nama = driver.find_element(:class, 'nav-shortened-name').text
    nama.should == "yudis"
  else
    Mail.defaults{
      retriever_method :imap, :address    => "pop.gmail.com",
                       :port       => 993,
                       :user_name  => 'yudistira96@gmail.com',
                       :password   => 'zykkgsekjzcvstml',
                       :enable_ssl => true
    }
    emails = Mail.find(:what => :last, :count => 1,:order => :asc, :from =>  "account-update@amazon.com")
    str1_markerstring = 'ht: 600">=0D'
    str2_markerstring = '<img width=3D"1" height=3D"1" src=3D'
    data1 = emails.to_s
    data = data1.split(str1_markerstring).last.split(str2_markerstring).first
    data2 = data.split("https://").last.split("=0D").first
    data3 = "https://" + data2
    decoded_uri = data3.unpack("M*")
    driver.switch_to.window( driver.window_handles.last )
    driver.navigate.to decoded_uri[0]
    driver.find_element(:name, 'customerResponseApproveButton').click
    sleep(5)
    nama = driver.find_element(:class, 'nav-shortened-name').text
    nama.should == "yudis"
  end
end

Then('validate if user already sign in') do
  nama = driver.find_element(:class, 'nav-shortened-name').text
  nama.should == "yudis"
end
