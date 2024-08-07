class AddApplicationIdToActions < ActiveRecord::Migration[7.1]
  def change
    add_column :actions, :application_id, :integer
  end
end
