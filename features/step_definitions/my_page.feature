@feature2
Feature: New user's page
  As a user
  I want to check My Page
  In order to make sure I don't have assigned and reported issues

  Scenario: User has My Page
    Given I visit Redmine homepage
    When I click registration button
    And I fill in registration form
    And I go to My Page
    Then I see that new user doesn't have assigned and reported issues
