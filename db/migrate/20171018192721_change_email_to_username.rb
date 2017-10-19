class ChangeEmailToUsername < ActiveRecord::Migration[5.1]
  def change
    
    change_table :users do |t|
      t.remove :email
      t.string :username
      #t.index :username
      
      #t.rename :email, :username
      
      add_index :users, :username,                unique: true
    end
  end
end
