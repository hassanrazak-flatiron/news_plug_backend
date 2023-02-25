class CreateTopHeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :top_headlines do |t|
      t.string :title
      t.string :author
      t.string :date
      t.string :source
      t.string :description
      t.string :url
      t.string :img_url
      t.string :content

      t.timestamps
    end
  end
end
