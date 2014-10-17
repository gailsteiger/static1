Given(/^I am on the home page$/) do
  visit 'index.html'
  expect(page).to have_selector('html')
  expect(page).to have_selector('body')
end

Given(/^I am on the "(.*?)" page$/) do |page|
  visit '/#{page}'
end

Then(/^I should see "(.*?)"$/) do |string|
  expect(page).to have_content string
end

