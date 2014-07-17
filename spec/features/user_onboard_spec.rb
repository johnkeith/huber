require_relative '../rails_helper'

feature "user enters basic information on homepage", js: true do
  scenario "fills in github username", :vcr do
    visit root_path
    fill_in "Your Github username", with: "johnkeith"
    select "Male", from: "gender-select"
    expect(page).to have_xpath "//img[@src=\"https://avatars.githubusercontent.com/u/4976905?\"]"
    expect(page).to have_css "div.has-success"
  end

  scenario "fills in a github username that doesn't exist", :vcr do
    visit root_path
    fill_in "Your Github username", with: "notaghuser"
    select "Male", from: "gender-select"
    expect(page).to have_content "Sorry, that is not a Github username."
    expect(page).to have_css "div.has-error"
  end

  scenario "selects own gender" do
    visit root_path
    select "Male", from: "gender-select"
    fill_in "Your Github username", with: "johnkeith"
    expect(page).to have_css "div.has-success"
  end

  scenario "selects preference for matches" do
    visit root_path
    select "Men", from: "match-pref-select"
    fill_in "Your Github username", with: "johnkeith"
    expect(page).to have_css "div.has-success"
  end

  scenario "fills username, selects gender, selects preferences", :vcr do
    visit root_path
    select "Male", from: "gender-select"
    select "Women", from: "match-pref-select"
    fill_in "Your Github username", with: "johnkeith"
    expect(page).to have_xpath "//img[@src=\"https://avatars.githubusercontent.com/u/4976905?\"]"
    expect(page).to have_select("gender-select", selected: "Male")
    expect(page).to have_select("match-pref-select", selected: "Women")
  end
end
