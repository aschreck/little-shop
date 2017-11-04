class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_items
  has_many :items, through: :orders_items

  enum status: [:ordered, :paid, :cancelled, :completed]

  def total
    items.sum(:price)
  end

  def quantity(id)
    item_ids.count(id)
  end

  def subtotal(item)
    item.price * quantity(item.id)
  end
end
