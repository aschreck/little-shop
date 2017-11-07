class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :items

  before_save :add_slug

  def add_slug
    self.slug = self.title.parameterize
  end

  def average_price
    items.average(:price)
  end

  def active?
    items.where(status: "active").count
  end

  def retired?
    items.where(status: "retired").count
  end
end
