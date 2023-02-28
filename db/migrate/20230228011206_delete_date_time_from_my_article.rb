class DeleteDateTimeFromMyArticle < ActiveRecord::Migration[7.0]
  def change
    remove_column :my_articles, :date
  end
end
