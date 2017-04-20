class AddResponseToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :response, :text
  end
end
