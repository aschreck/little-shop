require "rails_helper"

describe "A user that has already registered can log in and see show page" do
  it "user inputs information and is taken to their show page " do
    user = User.create(username: "user", name: "user", password: "password")
    visit '/login'

    fill_in "session[username]", with: "user"
    fill_in "session[password]", with: "password"
    click_button "Log In"

    expect(page).to have_content "Welcome, #{user.name}"
  end
end
