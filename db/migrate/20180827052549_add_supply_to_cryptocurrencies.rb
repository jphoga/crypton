class AddSupplyToCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptocurrencies, :Supply, :float
  end
end
