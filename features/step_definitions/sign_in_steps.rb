When(/^I go to the homepage$/) do
  visit root_path
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Forums")
end

When(/^I go to the forums$/) do
    visit root_path/forum
end

Then(/^I should be asked to sign in$/) do
    expect(page).to have_content("Log In")
end


