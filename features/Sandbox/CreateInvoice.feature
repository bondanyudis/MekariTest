@CreateInvoice
Feature: Mekari Create Invoice

#  @MainMenu
#  Scenario: Sign in and create invoice with existing pelanggan, inputting date, and existing product on list
#    Given user open already sign in to jurnal mekari
#    And user click button jual
#    When user click dropdown pelanggan and choose existing pelanggan
#    And user input transaction_transaction_date
#    And user input no_transaksi, no_referensi_pelanggan
#    And user add product from existing product
#    And user click button create
#    Then validate the value of old invoice

  @MainMenu2
  Scenario: Sign in and create invoice with new pelanggan, selecting date modal, and add new product on list
    Given user open already sign in to jurnal mekari
    And user click button jual
    When user click dropdown pelanggan and add new pelanggan
    And user input transaction_transaction_date by modal
    And user input no_transaksi, no_referensi_pelanggan
    And user add product from new product
    And user click button create
    Then validate the value of new invoice