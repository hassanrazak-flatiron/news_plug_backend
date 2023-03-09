class HotTakeSerializer < ActiveModel::Serializer
  attributes :id, :title, :summary, :tags, :created_at, :updated_at
 has_one :my_article
end
