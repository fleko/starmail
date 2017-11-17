class MessageSerializer < ActiveModel::Serializer
  attributes :id, :originator, :content, :recipient, :status
end
