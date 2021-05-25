class AddOriginalIdToEntryItems < ActiveRecord::Migration[6.1]
  def change
    add_column :entry_items, :original_id, :int
  end
end
