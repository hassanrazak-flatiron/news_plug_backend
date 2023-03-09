class CreateHotTakes < ActiveRecord::Migration[7.0]
  def change
    create_table :hot_takes do |t|
      t.belongs_to :my_article, null: false, foreign_key: true
      t.string :title
      t.string :summary
      t.string :tags

      t.timestamps
    end
  end
end
