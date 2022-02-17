class ChangeDataTypeForPhotoInUsers < ActiveRecord::Migration[6.1]
  def self.up
    change_table :users do |t|
      t.change :photo, :string, :default => 'https://www.google.com/search?q=trojan+horse&sxsrf=AOaemvIgPS9hACIDmzNuscea74xUZ2Y_Tg:1639212511562&source=lnms&tbm=isch&sa=X&sqi=2&ved=2ahUKEwjxu9m7rtv0AhUPr5UCHW4MDl4Q_AUoAXoECAIQAw&biw=1366&bih=663&dpr=1#imgrc=G3m5aFlhdiGMUM'
    end
  end
  def self.down
    change_table :users do |t|
      t.change :photo, :string
    end
  end
end
