class AddActionIdToActionPermission < ActiveRecord::Migration[7.1]
  def change
    add_column :action_permissions, :action_id, :integer
  end
end
