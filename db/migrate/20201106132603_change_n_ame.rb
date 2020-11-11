class ChangeNAme < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :type, :position
  end
end
