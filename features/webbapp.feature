Feature: As a developer, in order to be able to develop the webb app I want to set up the technical enviroment

Background:
  Given I am on the home page
  Then show me the page

Scenario: Make sure page is including all what we need
  Then the page should be titled "Start"
  And the page should have a meta tag for "author"
  And the page should have a meta tag for "description"
  And the page should have a meta tag for "viewport"
  And the page should include css for bootstrap.css
  And the page should include js for bootstrap.js
  And the page should include js for jquery-1.8.3.min.js
  And the page should include script for Google Analytics

Scenario: Make sure the directory structure is configured
  Then the current path should be home
  And there should be a css folder
  And there should be a js folder
  And there should be a img folder
  And there should be a fonts folder

Scenario: Load the home page/template
  Then I should see a navigation header
  And I should see a main content area
  And I should see a footer area


