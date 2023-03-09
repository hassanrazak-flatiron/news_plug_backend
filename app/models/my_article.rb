class MyArticle < ApplicationRecord

  has_many :hot_takes, dependent: :destroy
  
  belongs_to :user
  belongs_to :story
  belongs_to :top_headline, optional: true
end
