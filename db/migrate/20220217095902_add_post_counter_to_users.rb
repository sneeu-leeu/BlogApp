class AddPostCounterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :post_counter, :integer, :default => 0
  end
end
