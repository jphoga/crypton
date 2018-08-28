class AddVolumeToCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptocurrencies, :Volume, :float
  end
end
