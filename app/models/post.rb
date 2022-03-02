class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :comments
  has_many :likes

  def update_post_counter
    user.increment!('post_counter')
  end

  def load_recent_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end
