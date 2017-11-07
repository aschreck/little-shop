require 'rails_helper'
describe "User visits /cart with items in the cart." do
	it "they can increase the quantity" do
	  category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.50)
		user = User.create(name: "Bob", username: "user", password: "1234", role: "admin", address: "1234 Rails St")

		visit "/login"

		fill_in "session[username]", with: "user"
		fill_in "session[password]", with: "1234"

		click_button "Log In"



		visit items_path
		click_link "Add to Cart"

		click_on "View Cart"
		within(".table") do
			click_on "+"
		end

		within(".only") do
			click_on "Checkout"
		end

		expect(page).to have_content(2)
	end

end
