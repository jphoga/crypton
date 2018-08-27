class CreateCryptocurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :cryptocurrencies do |t|
      t.string :name
      t.float :market_price
      t.string :abbreviation
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
