class AddPermissionIdToActionPermission < ActiveRecord::Migration[7.1]
  def change
    add_column :action_permissions, :permission_id, :integer
  end
end
