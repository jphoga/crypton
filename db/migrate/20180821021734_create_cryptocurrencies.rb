class CreateCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptocurrencies do |t|
      t.string :name
      t.float :market_price
      t.string :abbreviation

      t.timestamps
    end
  end
end
