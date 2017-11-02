class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(slug: params[:title])
  end
end
