require 'selenium-webdriver'
require 'rubygems'
require 'rspec'
require 'mail'
require "test/unit"


driver = Selenium::WebDriver.for :chrome                                     # webdriver with chromedriver

Given('user open already sign in to jurnal mekari') do
  driver.navigate.to 'https://sandbox.jurnal.id/'
  driver.find_element(:id, 'user_email').send_keys "yudistira96@gmail.com"
  driver.find_element(:id, 'user_password').send_keys "yud1st1r4"
  driver.find_element(:id, 'new-signin-button').click
end

When('user click button jual') do
  driver.find_element(:id, 'menu-bar-invoice-create').click
end

And('user click dropdown pelanggan and choose existing pelanggan') do
  driver.find_element(:id, 'select2-chosen-19').click
  driver.find_element(:id, 's2id_autogen19_search').click
  sleep(5)
  driver.find_element(:id, 's2id_autogen19_search').send_keys "yudis"
  sleep(5)
  driver.find_element(:class, 'select2-result-label').click
  sleep(5)

end

And('user click dropdown pelanggan and add new pelanggan') do
  dateTime = Time.now.strftime("%Y%m%d%H%M%S").to_s
  name = "bondan" + dateTime

  driver.find_element(:id, 'select2-chosen-19').click
  # driver.find_element(:id, 's2id_autogen19_search').click
  sleep(5)
  driver.find_element(:id, 'select2-result-label-0').click
  sleep(5)
  driver.find_element(:id, 'person_display_name').send_keys name
  driver.find_element(:id, 'person_email').send_keys "yudistira@gmail.com"
  driver.find_element(:id, 'person_billing_address').send_keys "dinoyo" + dateTime
  driver.find_element(:id, 'person_phone').send_keys "08765457876"
  driver.find_element(:id, 'aodc-add').click
  sleep(5)

end


And('user input transaction_transaction_date') do
  driver.find_element(:id, 'transaction_transaction_date').clear
  driver.find_element(:id, 'transaction_transaction_date').send_keys "26/11/2020"
  sleep(5)
end

And('user input transaction_transaction_date by modal') do
  driver.find_element(:id, 'transaction_transaction_date').click
  sleep(3)
  driver.find_element(:xpath, "//td[contains(text(), '27')]").click
  sleep(5)
end

And('user add product from existing product') do
  driver.find_element(:id, 'select2-chosen-20').click
  driver.find_element(:id, 's2id_autogen20_search').click
  sleep(5)
  driver.find_element(:id, 's2id_autogen20_search').send_keys "penjualan"
  sleep(5)
  driver.find_element(:class, 'select2-result-label').click
  sleep(5)
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_description').send_keys "penjualan"
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_rate').send_keys 100000
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_discount').clear
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_discount').send_keys 1

end

And('user add product from new product') do
  dateTime = Time.now.strftime("%Y%m%d%H%M%S").to_s
  driver.find_element(:id, 'select2-chosen-20').click
  sleep(5)
  driver.find_element(:id, 'select2-result-label-0').click
  sleep(15)
  driver.find_element(:id, 'product_name').send_keys "penjualan" + dateTime

  driver.find_element(:id, 'select2-chosen-26').click
  sleep(5)
  driver.find_element(:id, 'select2-result-label-0').click
  sleep(5)
  driver.find_element(:id, 'product_unit_name').send_keys "pcs" + dateTime
  sleep(5)
  driver.find_element(:id, 'add-new-product-unit').click

  driver.find_element(:id, 'product_product_code').send_keys "A1101" + dateTime
  sleep(5)
  driver.find_element(:id, 's2id_product_product_category_ids').click
  sleep(5)

  driver.find_element(:id, 's2id_autogen16').send_keys "buah" + dateTime
  sleep(5)
  driver.find_element(:class, 'select2-result-label').click

  driver.find_element(:id, 'product_buy_price_per_unit').send_keys 10000

  # custom bu account
  sleep(5)
  driver.find_element(:id, 's2id_product_buy_account_id').click
  sleep(2)
  # driver.find_element(:id, 's2id_autogen10_search').send_keys 50100
  # sleep(5)
  # driver.find_element(:class, 'select2-result-label').click
  driver.find_element(:css, 'ul.select2-results > li:nth-child(2)').click


  sleep(5)
  driver.find_element(:id, 's2id_product_buy_tax_id').click
  sleep(5)
  driver.find_element(:id, 'select2-result-label-0').click

  sleep(4)
  driver.find_element(:id, 'company_tax_name').send_keys "sepulsa" + dateTime
  driver.find_element(:id, 'company_tax_rate').send_keys 100
  driver.find_element(:id, 'add-new-company-tax').click
  sleep(4)
  driver.find_element(:id, 'product_sell_price_per_unit').send_keys 100
  sleep(4)
  driver.find_element(:id, 's2id_product_sell_tax_id').click
  sleep(5)
  driver.find_element(:id, 'select2-result-label-0').click
  sleep(5)
  driver.find_element(:id, 'company_tax_name').send_keys "sepulsa1" + dateTime
  driver.find_element(:id, 'company_tax_rate').send_keys 1000
  driver.find_element(:id, 'add-new-company-tax').click
  sleep(5)
  driver.find_element(:id, 'add-new-product').click
  sleep(5)
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_description').send_keys "penjualan"
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_rate').send_keys 100000
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_discount').clear
  driver.find_element(:id, 'transaction_transaction_lines_attributes_0_discount').send_keys 1

end


And('user input no_transaksi, no_referensi_pelanggan') do
  dateTime = Time.now.strftime("%Y%m%d%H%M%S").to_s
  driver.find_element(:id, 'transaction_transaction_no').send_keys "11AB" + dateTime
  driver.find_element(:id, 'transaction_reference_no').send_keys "7878YUIH778789HJGH" + dateTime
  sleep(5)
end

And('user click button create') do
  # filename =  Dir.pwd + '/casing.jpg'
  # driver.find_element(:xpath, '//input[@type="file"]').send_keys filename
  sleep(5)
  driver.find_element(:id, 'create_button').click
  sleep(20)

end

Then('validate the value of old invoice') do |invoice|
  data = driver.find_element(:class, 'partially').text
  data1 = driver.find_element(:class, 'translation_missing').text
  # data2 = driver.find_element(:id, 'header_amount').text
  data3 = driver.find_element(:class, 'amount-due').text
  # data4 = driver.find_element(:id, 'total_before_discount').text
  data5 = driver.find_element(:class,  "alert-success").text
  # validatio

  data.should == "Belum Dibayar"
  data1.should == "Total Amount"
  # data2.should == "Rp. 99.000,00"
  data3.should == "Sisa Tagihan"
  # data4.should == "Rp. 99.000,00"
  data5.should == "×\nBerhasil diproses."
  # driver.find_element(:class, 'alert-success').text.include?("Berhasil diproses")
end


Then('validate the value of new invoice') do
  data = driver.find_element(:class, 'overdue').text
  data1 = driver.find_element(:class, 'translation_missing').text
  # data2 = driver.find_element(:id, 'header_amount').text
  data3 = driver.find_element(:class, 'amount-due').text
  # data4 = driver.find_element(:id, 'total_before_discount').text
  data5 = driver.find_element(:class,  "alert-success").text
  # validation

  data.should == "Lewat Jatuh Tempo"
  data1.should == "Total Amount"
  # data2.should == "Rp. 99.000,00"
  data3.should == "Sisa Tagihan"
  # data4.should == "Rp. 99.000,00"
  data5.should == "×\nBerhasil diproses."
  # driver.find_element(:class, 'alert-success').text.include?("Berhasil diproses")
end