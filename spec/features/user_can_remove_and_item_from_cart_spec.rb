require 'rails_helper'

describe "Visitor visits the /cart path" do
  it 'they can remove and item from the cart' do
    category = Category.create(title: "Thing")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.25, image: "asdfs")

    visit items_path

    click_link "Add to Cart"

    click_on "View Cart"

    expect(current_path).to eq "/cart"

    click_on "Remove"

    expect(page).to have_content("Successfully removed Soggy Cereal from your cart.")
  end
end
# As a visitor
# When I visit “/cart”
# And I click link “Remove”
# Then my current page should be “/cart”
# And I should see a message styled in green
# And the message should say “Successfully removed SOME_ITEM from your cart.”
# And the title “SOME_ITEM” should be a link to that item in case the user wants to add it back
# And I should not see the item listed in cart