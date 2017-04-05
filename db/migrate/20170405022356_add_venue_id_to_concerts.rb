class AddVenueIdToConcerts < ActiveRecord::Migration
  def change
    add_column :concerts, :venue_id, :integer
  end
end
