require 'rails_helper'

describe "Visitor visits the /cart path" do
  it 'they can remove and item from the cart' do
    category = Category.create(title: "Thing")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.25)

    visit items_path

    click_link "Add to Cart"

    click_on "View Cart"

    expect(current_path).to eq "/cart"

    within(".table") do
      click_on "Remove"
    end

    expect(page).to have_content("Successfully removed Soggy Cereal from your cart.")
  end
end
