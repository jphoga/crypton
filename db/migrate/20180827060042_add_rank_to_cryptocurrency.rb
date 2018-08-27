class AddRankToCryptocurrency < ActiveRecord::Migration[5.2]
  def change
    add_column :cryptocurrencies, :rank, :integer
  end
end
