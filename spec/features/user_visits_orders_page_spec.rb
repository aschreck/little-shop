require 'rails_helper'

describe 'When a logged in user visits /orders' do
  it 'they see a list of their orders' do
    user = User.create(username: "user", password: "password", name: "Person")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    order_1 = Order.create(status: 3, user: user)
    order_2 = Order.create(status: 3, user: user)
    order_3 = Order.create(status: 3, user: user)

    visit orders_path

    expect(page).to have_content(order_1.id)
    expect(page).to have_content(order_2.id)
    expect(page).to have_content(order_3.id)
  end

  it "they see a link to go to order show page" do
    user = User.create(username: "user", password: "password", name: "Person")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = Category.create(title: "Stuff")
    item = category.items.create(title: "Thing", description: "Its a thing", price: 10.00, image: "thing.png")
    order_1 = Order.create(status: 3, user: user, item_ids: [item.id, item.id])

    visit orders_path

  click_on "Show Order"

    expect(current_path).to eq(order_path(order_1))
    expect(page).to have_content(item.title)
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.price)
    expect(page).to have_content(order_1.status)
    expect(page).to have_content(order_1.created_at)
    expect(page).to have_content(20.00)
  end
end
