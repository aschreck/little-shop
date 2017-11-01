require "rails_helper"

describe "when a user is logged in" do
  it "shows logout" do
    user = User.create(name: "Bob", username: "bobby", password: "1234")

    visit login_path

    fill_in "session[username]", with: "bobby"
    fill_in "session[password]", with: "1234"
    click_on "Log In"

    expect(page).to have_content("Logout")
  end

end
