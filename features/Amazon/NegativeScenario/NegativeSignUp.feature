@AmazonSignUpNegative
Feature: Amazon Sign Up

  @negativeSignUp
  Scenario: Sign Up into Amazon System
    Given user open amazon website for negative sign up
    And user click button create acccount for negative sign up
    When user input name, email, and invalid password
    Then validate password must match message appear