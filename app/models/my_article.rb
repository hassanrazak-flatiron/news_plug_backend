class MyArticle < ApplicationRecord
  belongs_to :user
  belongs_to :story
  belongs_to :top_headline, optional: true
end
