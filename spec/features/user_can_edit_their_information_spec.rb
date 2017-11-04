require "rails_helper"

describe "when a user visits their dashboard and clicks edit account" do
	it "they see a form and can fill it out and click submit to edit their account" do
		user = User.create(name: "Ralph", username: "user", password: "user")

		visit '/login'
		fill_in "session[username]", with: "user"
    fill_in "session[password]", with: "user"
    click_button "Log In"
		expect(current_path).to eq '/dashboard'

		click_on "Edit Account"

		expect(current_path). to eq(edit_user_path(user))

		fill_in "user[name]",     with: "David"
		fill_in "user[username]", with: "user"
		fill_in "user[password]", with: "pass"

		click_on "Update User"

		expect(current_path).to eq('/dashboard')
		expect(page).to have_content("David")
	end

end 
