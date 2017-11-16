Feature: User can submit a tip and then view it on a different page
  
  As a user of this website
  So that I can contribute tips
  I want to be able to submit them using this page
  
Scenario: Add a tip
  Given I am on the SocialSupportNetwork home page
  And I am logged in
  When I follow "Anonymously Submit Advice"
  Then I should be on the Tips page
  When I fill in "Title" with "Testing Tip"
  And I fill in "Body" with "test"
  And I select "Misc." from "Subject"
  And I press "Submit"
  Then I should be on the "Tips" page
  When I press "Back"
  Then I should be on the "Tips" page
  And I should see "Testing Tip"