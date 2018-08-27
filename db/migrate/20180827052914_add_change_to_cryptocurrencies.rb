class AddChangeToCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptocurrencies, :Change, :float
  end
end
