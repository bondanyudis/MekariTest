@AmazonSignIn
Feature: Amazon Sign In

  @MainMenu
  Scenario: Sign In into Amazon System
    Given user open amazon website for sign in
    When user input email yudistira96@gmail.com
    And user input password YUd1$t1r4sug4nd1
    And user click Sign in
    Then validate if user already sign in