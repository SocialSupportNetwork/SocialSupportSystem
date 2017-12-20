class RemoveScreeningFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :screening, :string
  end
end
