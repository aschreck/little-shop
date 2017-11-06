class Item < ApplicationRecord
  belongs_to :category
  has_many :orders_items
  has_many :orders, through: :orders_items
  validates_presence_of :title, :description, :price

  validates :title, uniqueness: true
  validates :price, numericality: {greater_than_or_equal_to: 0}

	enum status: [:active, :retired]
end
