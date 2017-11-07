require 'rails_helper'

describe "When a user adds items to their cart and visits cart page" do
	it "cannot see checkout button if they are not logged in" do
		category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.25)

		visit "/cart"

		expect(page).to have_content("Create Account")

	end

	it "user can checkout with items in their cart and sees a flash message and is redirected to order page" do
		category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.25)
		user = User.create(name: "Ralph", username: "RalphBoy84", password: "password")
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

		visit items_path

		click_on "Add to Cart"

		visit "/cart"

		within(".only") do
			click_on "Checkout"
		end

		expect(current_path).to eq("/orders")
		expect(page).to have_content("Order was successfully placed")
	end
end
