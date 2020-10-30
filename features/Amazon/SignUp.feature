@AmazonSignUp
Feature: Amazon Sign Up

  @MainMenu
  Scenario: Sign Up into Amazon System
    Given user open amazon website for sign up
    And user click button create acccount
    When user input name, email, and password
    And user go to email to get opt yudistira96@gmail.com and input OTP
    Then validate if user already sign in