class UserNote < ApplicationRecord
    belongs_to :user
    belongs_to :entry_item
end
