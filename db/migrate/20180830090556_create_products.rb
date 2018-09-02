class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string      :name,          null: false
      t.integer     :code,          null: false,  index: true,  limit: 1,   default: 0
      t.string      :description
      t.timestamps
    end

    create_table :products do |t|
      t.string      :name,          null: false,  index: true
      t.string      :description
      t.string      :color
      t.decimal     :price,                                                 default: 0
      t.integer     :count,                                                 default: 0
      t.belongs_to  :category,      null: false,  index: true
      t.timestamps
    end
  end
end
