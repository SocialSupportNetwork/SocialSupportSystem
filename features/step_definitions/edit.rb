When(/^I go to the forums$/) do
  visit root_path/forum
end

Then(/^I should see the General topic$/) do
  expect(page).to have_content("General")
end

When(/^I go to the forums$/) do
    visit root_path/forum
end

Then(/^I should see the General topic/) do
    expect(page).to have_content("General")
end

When(/^I go to the General Topic/) do
    visit root_path/forum
end

When(/^I go to the forums$/) do
    visit root_path/forum/forum/general
end

Then(/^I should see the Group Consensus forum$/) do
    expect(page).to have_content("Group Consensus")
end

When(/^I go to edit a post$/) do
    visit root_path/forum/general/group-consensus/6/edit
end

When(/^I go to the Group Consensus forum$/) do
    visit root_path/forum/general/group-consensus
end

Then(/^I should see "(edited)" next to my post$/) do
    expect(page).to have_content("(edited)")
end
