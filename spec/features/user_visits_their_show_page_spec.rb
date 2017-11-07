require 'rails_helper'

describe 'User logs in and visits their show page' do
  it 'they see their information' do
    user = User.create(name: "Duder", username: "BigDawg1987", password: "password")
    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: user.password
    click_on "Log In"
    save_and_open_page
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content(user.username)
    expect(page).to have_content(user.name)
  end
end
