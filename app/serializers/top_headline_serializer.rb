class TopHeadlineSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :date, :source, :description, :url, :img_url, :content
end
