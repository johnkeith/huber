require_relative '../rails_helper'

feature "user enters basic information on homepage" do
  scenario "fills in github username" do
    visit root_path
    fill_in "Your Github username", with: "johnkeith"
    select "Male", from: "My gender is"
    expect(page).to have_xpath "//img[@src=\"https://avatars.githubusercontent.com/u/4976905?\"]"
    expect(page).to have_xpath "//i[@class=\"fa fa-check\"]"
  end

  scenario "fills in a github username that doesn't exist" do
    visit root_path
    fill_in "Your Github username", with: "notaghuser"
    select "I contain multitudes", from: "My gender is"
    expect(page).to have_content "Sorry, that is not a Github user name."
  end

  scenario "selects own gender" do
    visit root_path
    select "Male", from: "Tell us your gender"
    expect(page).to have_xpath "//i[@class=\"fa fa-check\"]"
  end

  scenario "selects preference for matches" do
    visit root_path
    select "Men", from: "Match me with"
    expect(page).to have_xpath "//i[@class=\"fa fa-check\"]"
  end

  scenario "fills username, selects gender, selects preferences" do
    visit root_path
    fill_in "Your Github username", with: "johnkeith"
    select "Male", from: "My gender is"
    select "Men", from: "Match me with"
    expect(page).to have_xpath "//img[@src=\"https://avatars.githubusercontent.com/u/4976905?\"]"
    expect(page).to have_css "i.fa-check", count: 3
  end
end
