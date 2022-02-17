class ChangeUserToAuthorAsReferences < ActiveRecord::Migration[6.1]
  def self.up
    change_table :posts do |t|
      t.references :author, foreign_key: {to_table: 'users'}
    end
  end
  def self.down
    change_table :posts do |t|
      t.references :user, null: false, foreign_key: true
    end
  end
end
