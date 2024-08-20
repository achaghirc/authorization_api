class RemovePermissionFromActionPermission < ActiveRecord::Migration[7.1]
  def change
    remove_column :action_permissions, :permission, :integer
  end
end
