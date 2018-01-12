class CreateTips < ActiveRecord::Migration[5.1]
  def change
    create_table :tips do |t|
      t.string :title
      t.string :body
      t.integer :topic_id
      t.integer :subtopic_id

      t.timestamps
    end
  end
end
