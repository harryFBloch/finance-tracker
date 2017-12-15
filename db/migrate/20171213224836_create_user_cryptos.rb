class CreateUserCryptos < ActiveRecord::Migration
  def change
    create_table :user_cryptos do |t|
      t.references :user, index: true, foreign_key: true
      t.references :crypto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
