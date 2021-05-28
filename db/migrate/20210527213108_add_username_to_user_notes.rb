class AddUsernameToUserNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :user_notes, :username, :string
  end
end
