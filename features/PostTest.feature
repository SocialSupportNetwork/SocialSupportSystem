Feature: User can create a new post that is added to the forum
  
  Scenario: Add a post
    Given I am on the Social Support Network forum page
    When I press "General"
    Then I should be on the General Forums page
    When I press "Start a New Topic"
    Then I should fill in "Title" with "Test Post"
    And I should fill in "Content" with "Testing 1 2 3"
    And I press "Create New Topic"
    Then I should be on the General Forums page
    And I should see the new topic I created