class CreateTips < ActiveRecord::Migration[5.1]
  def change
    create_table :tips do |t|
      t.string :title
      t.string :body
      t.string :subject

      t.timestamps
    end
  end
end
