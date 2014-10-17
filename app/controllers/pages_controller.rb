class PagesController < ApplicationController
  def index
  end

  def about
  end

  def page_params
    params.require(:page).permit(:title, :slug, :blurb, :content)
  end

end
