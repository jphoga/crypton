class AddMarketcapToCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptocurrencies, :Marketcap, :float
  end
end
