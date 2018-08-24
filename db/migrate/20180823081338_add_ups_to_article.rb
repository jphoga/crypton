class AddUpsToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :ups, :integer
  end
end
