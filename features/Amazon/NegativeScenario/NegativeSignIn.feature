@AmazonSignInNegative
Feature: Amazon Sign In

  @SignIninvalidemail
  Scenario Outline: Sign In into Amazon System
    Given user open amazon website for negative case
    When user input invalid email <email>
    Then validate if account not found message appear

    Examples:
    |email                   |
    |yudistira961@gmail.com  |
    |yudistira96gmail.com    |
    |yudistira9611@gmailcom  |

  @SignIninvalidpassword
  Scenario Outline: Sign In into Amazon System
    Given user open amazon website for negative case
    When user input invalid email <email>
    And user input invalid password <password> and click sign in
    Then validate if password is incorrect message appear

    Examples:
      |email                  |password          |
      |yudistira96@gmail.com  |YUd1$t1r4sug4nd111|
      |yudistira96@gmail.com  |yud1st1r4         |