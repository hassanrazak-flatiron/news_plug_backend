class MyArticleSerializer < ActiveModel::Serializer
  attributes :id, :story, :user, :workflow
  has_one :user
  has_one :story
  has_one :top_headline
end
