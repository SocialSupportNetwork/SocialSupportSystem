Feature: Sign In
As a Admin
I want our users to be prompted to log in 
So that anonymous visitors cannot access the forums

Scenario: User must log in when accessing forums
When I go to the homepage
Then I should see the forum link
When I go to the forums
Then I should be asked to sign in