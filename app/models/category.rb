class Category < ActiveRecord::Base
  #attr_accessible :title, :slug, :description
  has_many :categorizings
  has_many :posts, through: :categorizings
end
