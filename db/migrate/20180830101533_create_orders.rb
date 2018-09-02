class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.decimal     :cost,            null: false
      t.decimal     :discount,        null: false
      t.string      :currency,        null: false
      t.datetime    :expiration_time, null: false
      t.decimal     :total_cost,      null: false
      t.integer     :status,          null: false, index: true, limit: 1, default: 0
      t.timestamps
    end
    
    create_table :order_products do |t|
      t.belongs_to  :product,         null: false,  index: true
      t.belongs_to  :order,           null: false,  index: true
      t.timestamps
    end

    create_table :payment_transactions do |t|
      t.string     :description,      null: false
      t.integer    :status,           null: false, index: true, limit: 1, default: 0
      t.decimal    :amount,           null: false
      t.string     :currency,         null: false
      t.belongs_to :order,            null: false,  index: true
      t.timestamps
    end

    create_table :baskets do |t|
      t.decimal     :cost
      t.decimal     :discount
      t.string      :currency
      t.integer     :user_id,         null: false
      t.timestamps
    end
    
    create_table :basket_products do |t|
      t.belongs_to  :product,         null: false,  index: true
      t.belongs_to  :basket,          null: false,  index: true
      t.timestamps
    end
  end
end
