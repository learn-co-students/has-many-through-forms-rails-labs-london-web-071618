class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def username=(username)
    if username != ""
      self.user = User.find_or_create_by(username: username)
    end
  end

  def username
    self.user ? self.user : nil
  end

  def user_id=(id)
    self.user = User.find_or_create_by(id:id)
    self.save
  end

  def user_id
    self.user ? self.user : nil
  end
end
