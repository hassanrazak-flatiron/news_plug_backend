class DeleteSummaryMyArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :my_articles, :summary
  end
end
