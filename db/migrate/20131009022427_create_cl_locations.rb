class CreateClLocations < ActiveRecord::Migration
  def change
    create_table :cl_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
