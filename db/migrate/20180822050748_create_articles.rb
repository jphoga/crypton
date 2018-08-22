class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.string :description
      t.integer :likes
      t.string :news_url
      t.string :news_url
      t.datetime :publishedAt
      t.timestamps
    end
  end
end
