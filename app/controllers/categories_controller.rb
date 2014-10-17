class CategoriesController < ApplicationController

  def index
    @category = Category.all
  end

  private
  def post_params
    params.require(:category).permit(:title, :slug, :description)
  end

end
