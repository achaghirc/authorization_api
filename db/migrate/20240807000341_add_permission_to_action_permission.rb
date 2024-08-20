class AddPermissionToActionPermission < ActiveRecord::Migration[7.1]
  def change
    add_column :action_permissions, :permission, :integer
  end
end
