class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories


  def unique_users
    self.comments.map {|comment| comment.user}.uniq
  end

  def categories_attributes=(categories_attributes)
    categories_attributes.values.each do |category_attribute|
      self.categories << Category.find_or_create_by(category_attribute)
    end
  end

  def categories_attributes
    self.categories.map {|category| category.name}
  end

end
