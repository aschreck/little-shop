require "rails_helper"
describe "when admin can visit admin dashboard" do
  it "they see the admin dashboard page" do
    user = User.create(name: "Bob", username: "bobby", password: "1234", role: "admin", address: "1234 Rails St")

    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_on "Log In"

    expect(current_path).to eq(admin_dashboard_path)

    expect(page).to have_content("Admin Dashboard")
  end

  it "they do not see the admin dashboard page if they are a user" do
    user = User.create(name: "Bob", username: "bobby", password: "1234", address: "1234 Rails St")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content("404")
  end

  it "guest do not see the admin dashboard" do
    visit admin_dashboard_path

    expect(page).to have_content("404")
  end

end
