class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :me_id
      t.integer :you_id
      t.string :room_id

      t.timestamps

    end
    add_index :messages, [:room_id, :created_at]
  end
end
