class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :user_notes, :entry_items
end
