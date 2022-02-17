class AddPostsCounterToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :posts_counter, :integer, :default => 0
  end
end
