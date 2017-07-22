class CreateBtcPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :btc_prices do |t|
      t.float :price
      t.datetime :timestamp

      t.timestamps
    end
  end
end
