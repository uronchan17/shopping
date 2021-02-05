class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.integer  :area_id
      t.integer  :total_fee
      t.integer  :payment_id
      t.integer  :delivery_fee_id
      t.integer  :delivery_days_id
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
