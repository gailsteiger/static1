Feature: As a developer,
  In order to be able to collaborate with my friends
  I want to set up Google+events

Scenario: Create event
Given I am on the community site
Then show me the page
And I click "Create event"
Then I should see "Event title"
And ...

