class CreateEntryItems < ActiveRecord::Migration[6.1]
  def change
    create_table :entry_items do |t|
      t.string :name
      t.string :category
      t.string :image_url

      t.timestamps
    end
  end
end
