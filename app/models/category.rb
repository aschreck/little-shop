class Category < ApplicationRecord
  has_many :items

  before_save :add_slug

  def add_slug
    self.slug = self.title.parameterize
  end
end
