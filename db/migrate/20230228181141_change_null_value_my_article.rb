class ChangeNullValueMyArticle < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:my_articles, :top_headline_id, true, "no headline article")
  end
end
