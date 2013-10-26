class CreateLocationSearchesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :cl_locations, :searches do |t|
      t.index [:cl_location_id, :search_id]
      t.index [:search_id, :cl_location_id]
    end
  end
end
