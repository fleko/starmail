class AddUniqueIndexToClient < ActiveRecord::Migration[5.1]
  def change
    add_index :clients, :name, unique: true
  end
end
