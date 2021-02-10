class AddListToBuyer < ActiveRecord::Migration[6.0]
  def change
    add_column :buyers, :list, :text
  end
end
