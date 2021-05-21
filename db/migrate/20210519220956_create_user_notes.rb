class CreateUserNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_notes do |t|
      t.text :note
      t.references :user
      t.references :entry_item
      t.timestamps
    end
  end
end
