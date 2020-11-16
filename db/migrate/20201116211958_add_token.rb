class AddToken < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :token, :string
    add_index :users, :token, unique: true
    add_index :users, :email, unique: true
  end
end
