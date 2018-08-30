class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.decimal     :firstname, 	null: false
      t.decimal     :lastname,  	null: false
      t.decimal     :phone,     	null: false
      t.decimal     :email,     	null: false
      t.string      :login,		  	null: false
      t.string      :password,		null: false
      t.references  :orders,        						index: true
      t.references  :basket,          					index: true
      t.timestamps
    end
  end
end
