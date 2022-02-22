class Post < ApplicationRecord
  belongs_to :author ,class_name: "User"
  has_many :comments
  has_many :likes

  def update_post_counter(arg)
    User.update('post_counter', arg)
  end

end
