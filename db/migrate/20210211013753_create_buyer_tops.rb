class CreateBuyerTops < ActiveRecord::Migration[6.0]
  def change
    create_table :buyer_tops do |t|
      t.references :top,           null: false, foreign_key: true
      t.references :buyer,         null: false, foreign_key: true
      t.integer    :tops_quantity
      t.timestamps
    end
  end
end
