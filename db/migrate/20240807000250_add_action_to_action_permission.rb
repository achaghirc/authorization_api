class AddActionToActionPermission < ActiveRecord::Migration[7.1]
  def change
    add_column :action_permissions, :action, :integer
  end
end
