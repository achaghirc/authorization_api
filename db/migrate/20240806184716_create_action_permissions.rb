class CreateActionPermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :action_permissions do |t|

      t.timestamps
    end
  end
end
