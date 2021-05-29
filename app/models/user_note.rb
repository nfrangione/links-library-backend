class UserNote < ApplicationRecord
    belongs_to :user
    belongs_to :entry_item

    validates :user_id, uniqueness: {scope: :entry_item_id}
end
