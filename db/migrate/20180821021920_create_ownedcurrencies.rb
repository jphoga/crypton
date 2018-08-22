class CreateOwnedcurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :ownedcurrencies do |t|
      t.float :quantity
      t.references :cryptocurrency, foreign_key: true
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
