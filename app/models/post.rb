class Post < ActiveRecord::Base
  #attr_accessible :title, :slug, :blurb, :content, :category_id
  has_many :categorizings
  has_many :categories, through: :categorizings

  def self.categorized_with(title)
    Category.find_by_title!(title).posts
  end

  def self.category_count
    Category.select("categories.*, count(categorizings.category_id) as count").joins(:categorizings).group("categorizings.category_id")
  end

  def category_list
    categories.map(&:title).join(", ")
  end

  def category_list=(titles)
    self.categories = titles.split(",").map do |n|
      Category.where(title: n.strip).first_or_create!
    end
  end
end
