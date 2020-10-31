How to run the test : 
1. clone the project from github
2. import or open the project to your IDE (for me RubyMine)
3. on terminal type "cucumber" to ru all test
4. but if you want to run specific tags you can use "cucumber --tags @AmazonSignIn"
but before run this test, comment first this code "driver = Selenium::WebDriver.for :chrome" for all unused class
ex : in this case there are 5 ruby class, if you want to run only class stepsSignUp, so comment all "driver = Selenium::WebDriver.for :chrome" except stepsSignUp.rb
5. And the last wait until test done