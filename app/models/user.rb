class User < ApplicationRecord
    has_many :user_notes
    has_many :entry_items, through: :user_notes
    
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
