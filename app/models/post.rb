class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :user
  has_many :comments
  has_many :likes

  def update_post_counter(arg)
    user.update('post_counter', arg)
  end

  def recent_post_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
