Feature: User logs in
  In order to keep their information save
  Users want to log in.
  
  Scenario: User logs in
    Given a user with the email address "kevin@example.com"
    Given I am on the home page
    Then I should see "Sign in"
    And I should not see "Foos"
    
    When I fill in "Email" with "kevin@example.com"
    And I fill in "Password" with "test123"
    And I press "Sign in"
    
    Then I should see "Foos"
