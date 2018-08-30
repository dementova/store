class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.decimal     :cost,            null: false
      t.integer     :sales_limit
      t.datetime    :start_time,      null: false
      t.datetime    :expiration_time, null: false
      t.references  :products,        null: false,    index: true
      t.timestamps
    end
  end
end
