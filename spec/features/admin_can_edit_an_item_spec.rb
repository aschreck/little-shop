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

      visit admin_items_path

      click_on "Edit"

      expect(current_path).to eq("/admin/items/#{item.id}/edit")

      fill_in "item[title]", with: "Goal"
      fill_in "item[description]", with: "better"

      click_on "Update Item"

      expect(page).to have_content("The item was updated!")
    end
  end
