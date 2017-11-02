class AdviceTable < ActiveRecord::Migration[5.1]
  def change
    create_table :advice do |t|
      t.string :title
      t.text :tip
      t.string :subject
    end
  end
end
