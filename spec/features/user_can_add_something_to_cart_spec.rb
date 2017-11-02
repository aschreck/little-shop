require 'rails_helper'

describe "When I visit any page with an item on it" do
  it "I can see a link or button for Add to Cart" do
    category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.25, image: "asdfs")

    visit items_path

    expect(page).to have_content("Cart")
    click_link "Add to Cart"

    click_on "View Cart"


    expect(current_path).to eq "/cart"
    expect(page).to have_content(item.title) 
  end
end
