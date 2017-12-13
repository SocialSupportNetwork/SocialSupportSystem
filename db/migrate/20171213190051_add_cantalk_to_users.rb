class AddCantalkToUsers < ActiveRecord::Migration[5.1]
  def change
        remove_column :users, :canTalk, :boolean, null: false, default: false
        add_column :users, :canTalk, :boolean, null: false, default: true
  end
end
