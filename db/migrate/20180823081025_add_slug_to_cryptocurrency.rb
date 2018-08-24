class AddSlugToCryptocurrency < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptocurrencies, :website_slug, :string
  end
end
