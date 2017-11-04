require "rails_helper"

describe "when admin clicks on link to change order" do
  it "changes the order to other status" do
    category = Category.create(title: "Breakfast")
    item = category.items.create(title: "Soggy Cereal", description: "Kinda gross", price: 1.50, image: "asdfs")
    admin = User.create(name: "Doug", username: "DougBoy84", password: "password", role: "admin")
    visit '/login'
		fill_in "session[username]", with: "DougBoy84"
    fill_in "session[password]", with: "password"
    click_button "Log In"
    user = User.create(name: "Ralph", username: "RalphBoy84", password: "password")
    order = user.orders.create(status: "ordered")

    visit admin_dashboard_path

    click_on "cancel"

    expect(Order.first.status).to eq("cancelled")
  end

end
