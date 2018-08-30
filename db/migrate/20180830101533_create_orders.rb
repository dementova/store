class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal     :cost,            null: false
      t.decimal     :discount,        null: false
      t.string      :currency,        null: false
      t.datetime    :expiration_time, null: false
      t.decimal     :total_cost,      null: false
      t.integer     :status,          null: false, index: true, limit: 1, default: 0
      t.references  :products,        null: false, index: true
      t.references  :payments_transactions
      t.timestamps
    end

    create_table :payment_transactions do |t|
      t.string     :description,      null: false
      t.integer    :status,           null: false, index: true, limit: 1, default: 0
      t.float      :amount,           null: false
      t.string     :currency,         null: false
      t.references :orders,           null: false, index: true
      t.timestamps
    end

    create_table :baskets do |t|
      t.decimal     :cost,            null: false
      t.decimal     :discount,        null: false
      t.string      :currency,        null: false
      t.references  :products,        null: false, index: true
      t.references  :user,            null: false, index: true
      t.timestamps
    end
  end
end
