class CommentSerializer < ActiveModel::Serializer
  attributes :id, :author, :content
  has_one :post
end
