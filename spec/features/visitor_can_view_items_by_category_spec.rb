require 'rails_helper'

describe 'Visitor visits a categories show page' do
  it "they see all items associated with that category" do
    category = Category.create(title: "Stuff")
    item = category.items.create(title: "Thing", description: "Its a thing", price: 10.00, image: "thing.png")

		visit "/#{category.title}"

    expect(page).to have_content(category.title)
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
  end
end
