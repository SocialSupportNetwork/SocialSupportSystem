class AddCantalkToUsers < ActiveRecord::Migration[5.1]
  def change
        add_column :users, :canTalk, :boolean, null: false, default: true
  end
end
