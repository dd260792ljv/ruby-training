@feature1
Feature: Visitor Registration and Login
  As a visitor
  I want to be able to sign up and sign in
  In order to become a user

  Background:
    Given I visit Redmine homepage

  Scenario: Visitor successfully signs in
    Given I have preregistered user

    When I click login button
    And I fill in login form
    Then I see that I become logged in user

  Scenario: Visitor successfully signs up
    When I click registration button
    And I fill in registration form
    Then I see that I become logged in user