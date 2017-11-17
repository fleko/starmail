class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :originator
      t.string :content
      t.string :recipient
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
