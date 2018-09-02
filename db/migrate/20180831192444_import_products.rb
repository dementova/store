class ImportProducts < ActiveRecord::Migration[5.1]
  def change
  	Import::Beer.new.process!
  	Import::Book.new.process!
  end
end
