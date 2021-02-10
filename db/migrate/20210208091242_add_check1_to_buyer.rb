class AddCheck1ToBuyer < ActiveRecord::Migration[6.0]
  def change
    add_column :buyers, :check1, :integer
  end
end
