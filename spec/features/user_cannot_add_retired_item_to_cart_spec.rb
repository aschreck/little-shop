describe "When a user goes to the show page of a retired item" do
	it "they cannot add it to their cart" do 
		category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.25, image: "asdfs", status: 1)

    visit items_path

		expect(page).to_not have_content("Add to Cart")
		expect(page).to have_content("Item Retired")
	end 
end 
