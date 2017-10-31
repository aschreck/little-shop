describe "User visits /cart with items in the cart." do
	it "they can increase the quantity" do
	  category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.25, image: "asdfs")

		visit items_path
		click_link "Add to Cart"

		click_on "View Cart"
		fill_in "item[quantity]", with: 2
		click_on "Submit"
		save_and_open_page

		expect(page).to have_content(2)

	end
	it "they can decrease the quantity" do
	end 
end 
