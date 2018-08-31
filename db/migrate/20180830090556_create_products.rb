class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string      :name,          null: false,  index: true
      t.string      :description
      t.string      :color
      t.decimal     :price,         null: false
      t.integer     :count,         null: false
      t.references  :category,      null: false,  index: true
      t.references  :discount,                    index: true
      t.references  :orders,                      index: true
      t.timestamps
    end

    create_table :categories do |t|
      t.string      :name,          null: false
      t.integer     :code,          null: false,  index: true,  limit: 1,   default: 0
      t.string      :description
      t.references  :products,                    index: true
      t.timestamps
    end
  end
end
