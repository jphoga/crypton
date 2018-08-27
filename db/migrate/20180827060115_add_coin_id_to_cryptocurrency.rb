class AddCoinIdToCryptocurrency < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptocurrencies, :coin_id, :integer
  end
end
