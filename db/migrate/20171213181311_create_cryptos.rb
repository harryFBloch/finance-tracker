class CreateCryptos < ActiveRecord::Migration
  def change
    create_table :cryptos do |t|
      t.string :ticker
      t.decimal :last_price

      t.timestamps null: false
    end
  end
end
