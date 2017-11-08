require 'thredded/base_migration'
class AddDisplayNames < Thredded::BaseMigration
  def change
    create_table :display_names do |t|
      t.references :user, type: user_id_type, null: false, index: false
      t.references :post, null: false, index: false
      t.string :display_name, null: false
      
      t.index :post_id, name: :index_user_display_on_post_id
      t.index %i[user_id post_id], name: :index_user_display_on_user_id_post_id, unique: true
    end
  end
end
