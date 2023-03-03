class AddWorkFlowColumnMyArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :my_articles, :workflow, :integer
  end
end
