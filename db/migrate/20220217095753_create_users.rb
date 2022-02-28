class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, :default => 'https://www.google.com/search?q=trojan+horse&sxsrf=AOaemvIgPS9hACIDmzNuscea74xUZ2Y_Tg:1639212511562&source=lnms&tbm=isch&sa=X&sqi=2&ved=2ahUKEwjxu9m7rtv0AhUPr5UCHW4MDl4Q_AUoAXoECAIQAw&biw=1366&bih=663&dpr=1#imgrc=G3m5aFlhdiGMUM'
      t.text :bio
      t.integer :posts_counter, :default => 0
      t.timestamps
      t.integer :posts_counter, :default => 0
    end
  end
end
