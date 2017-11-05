require "rails_helper"

describe "when admin clicks on link to change order" do
  it "changes the order to other status" do
    admin = User.create(name: "Doug", username: "DougBoy84", password: "password", role: "admin", address: "1234 Rails St")
    visit '/login'
		fill_in "session[username]", with: "DougBoy84"
    fill_in "session[password]", with: "password"
    click_button "Log In"
    user = User.create(name: "Ralph", username: "RalphBoy84", password: "password", address: "1234 Rails St")
    category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 3.35)
    item_1 = category.items.create(title: "Thing", description: "Its a thing", price: 10.00)
    order = user.orders.create(status: "ordered", item_ids:[item.id, item.id,  item_1.id])

    visit admin_dashboard_path

    click_on "Show Order Number 1"
    save_and_open_page

    expect(current_path).to eq("/admin/orders/1")
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.address)
    expect(page).to have_content(item.title)
    expect(page).to have_content(item_1.title)
    expect(page).to have_content(2)
    expect(page).to have_content(16.70)
  end

end
