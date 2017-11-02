class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :items

  before_save :add_slug

  def add_slug
    self.slug = self.title.parameterize
  end
end
