class EntryItem < ApplicationRecord
    has_many :user_notes
    has_many :users, through: :user_notes
end
