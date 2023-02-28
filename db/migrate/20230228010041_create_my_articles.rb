class CreateMyArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :my_articles do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :story, null: false, foreign_key: true
      t.belongs_to :top_headline, null: false, foreign_key: true
      t.datetime :date
      t.string :summary

      t.timestamps
    end
  end
end
