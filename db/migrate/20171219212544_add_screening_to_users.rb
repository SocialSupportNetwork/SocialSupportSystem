class AddScreeningToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :screening, :text
  end
end
