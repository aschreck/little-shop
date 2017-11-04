require "rails_helper"
describe "When a admin logs in" do
	it "they see a dashboard with all orders" do
		category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.50, image: "asdfs")
		user = User.create(name: "Ralph", username: "RalphBoy84", password: "password")
		admin = User.create(name: "Doug", username: "DougBoy84", password: "password", role: "admin")
		visit '/login'
		fill_in "session[username]", with: "DougBoy84"
    fill_in "session[password]", with: "password"
    click_button "Log In"
		expect(current_path).to eq '/admin/dashboard'
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

		user.orders.create(status: "ordered")
		user.orders.create(status: "paid")
		user.orders.create(status: "completed")

		visit admin_dashboard_path

		expect(page).to have_content("Ordered")
		expect(page).to have_content("Paid")
		expect(page).to have_content("Completed")
	end
end
