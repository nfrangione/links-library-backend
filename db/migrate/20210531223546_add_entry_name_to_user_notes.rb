class AddEntryNameToUserNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :user_notes, :entry_name, :string
  end
end
