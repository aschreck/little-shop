require "rails_helper"

describe "when an admin visits the admin dashboard" do
  it "sees a link to go to all items" do
    admin = User.create(name: "Doug", username: "DougBoy84", password: "password", role: "admin", address: "1234 Rails St")
    visit '/login'
    fill_in "session[username]", with: "DougBoy84"
    fill_in "session[password]", with: "password"
    click_button "Log In"
    category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 3.35)
    item_1 = category.items.create(title: "Thing", description: "Its a thing", price: 10.00)

    click_on "Items"

    save_and_open_page
    expect(current_path).to eq("/admin/items")
    expect(page).to have_content("Soggy Cereal")
    expect(page).to have_content("Thing")
    expect(page).to have_content("Kinda gross")
  end

end
