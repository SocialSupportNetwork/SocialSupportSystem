require 'thredded/base_migration'

class AddDisplayNames < Thredded::BaseMigration
  def change
    create_table :display_names do |t|
      t.integer :user_id, type: user_id_type, null: false, index: false
      t.integer :topic_id, null: false, index: false
      t.string :display_name, null: false
      t.index %i[user_id topic_id], name: :index_user_display_on_user_id_topic_id, unique: true
    end
  end
end
