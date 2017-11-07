require "rails_helper"

describe "When a user clicks on a link to an item's showpage" do
	it "displays the item's show page" do
		category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.50)
		visit "/Breakfast"
		click_link item.title

		expect(page).to have_content(item.title)
		expect(page).to have_content(item.description)

	end 
end 
