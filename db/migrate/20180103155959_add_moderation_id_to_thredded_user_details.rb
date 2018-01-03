class AddModerationIdToThreddedUserDetails < ActiveRecord::Migration[5.1]
  def change
    add_column :thredded_user_details, :moderation_id, :integer
  end
end
