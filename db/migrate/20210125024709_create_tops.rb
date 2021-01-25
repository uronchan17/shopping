class CreateTops < ActiveRecord::Migration[6.0]
  def change
    create_table :tops do |t|
      t.string   :items
      t.integer  :price
      t.string   :explain
      t.integer  :stock
      t.integer  :category_id
      t.timestamps
    end
  end
end
