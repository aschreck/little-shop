require 'rails_helper'

describe "User visits the root path" do
  it "they can create an account" do
    visit root_path
    click_on "Login"
    expect(current_path).to eq("/login")

    click_on "Create Account"

    fill_in "user[username]", with: "person"
    fill_in "user[password]", with: "password"
    fill_in "user[name]", with: "Bill"
    click_on "Create User"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Logged in as #{User.last.name}")
    expect(page).to have_content("#{User.last.username}")
    expect(page).to have_no_content("Login")
    expect(page).to have_content("Logout")
  end
end
# As a visitor
# When I visit “/”
# Then I should see a link for “Login”
# And when I click “Login”
# And I should be on the “/login” page
# And I should see a link to “Create Account”
# And when I click link “Create Account”
# And I fill in my desired credentials
# And I submit my information
# Then my current page should be “/dashboard”
# And I should see a message in the navbar that says “Logged in as SOME_USER”
# And I should see my profile information
# And I should not see a link for “Login”
# And I should see a link for “Logout”
