class MyArticleSerializer < ActiveModel::Serializer
  attributes :id, :summary
  has_one :user
  has_one :story
  has_one :top_headline
end
