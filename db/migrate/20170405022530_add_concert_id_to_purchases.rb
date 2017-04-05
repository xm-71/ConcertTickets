class AddConcertIdToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :concert_id, :integer
  end
end
