class RemoveActionFromActionPermission < ActiveRecord::Migration[7.1]
  def change
    remove_column :action_permissions, :action, :integer
  end
end
