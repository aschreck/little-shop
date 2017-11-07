require "rails_helper"

describe "when user is not logged in he cannot see checkout" do
  it "should not have content checkout" do
    user = User.create(name: "Bob", username: "bobby", password: "1234", address: "1234 Rails St")
    visit cart_path
    category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.50)

    visit items_path
    click_link "Add to Cart"

    click_on "View Cart"
    within(".only_1") do
      click_on "Login or Create Account to Checkout"
    end
    expect(page).to have_content("Login or Create Account to Checkout")

    click_on "Login or Create Account to Checkout"

    expect(page).to have_content("Username")
    expect(page).to have_content("Password")

    click_on "Create Account"

    fill_in "user[username]", with: "person"
    fill_in "user[password]", with: "password"
    fill_in "user[name]", with: "Bill"
    click_on "Create User"

    expect(page).to have_content("Logout")
    click_on "View Cart"
    within(".table") do
      click_on("+")
    end

    expect(page).to have_content("Checkout")
    expect(page).to have_content(2)
  end

end
