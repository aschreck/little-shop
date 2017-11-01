class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_items
  has_many :items, through: :orders_items

  enum status: [:ordered, :paid, :cancelled, :completed]

  def total
    sprintf('%.2f', items.sum(:price))
  end
end
