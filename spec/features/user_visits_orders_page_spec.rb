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
end
