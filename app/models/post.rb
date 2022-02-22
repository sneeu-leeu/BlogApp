class Post < ApplicationRecord
  belongs_to :author ,class_name: "User"
  has_many :comments
  has_many :likes

  def update_post_counter(arg)
    user.update('post_counter', arg)
  end

  def recent_post_comments(limit = 5)
    comments.oder(created_at: :desc).limit(limit)
  end

end
