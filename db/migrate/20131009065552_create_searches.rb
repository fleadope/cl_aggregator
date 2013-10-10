class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :terms
      t.integer :min_price
      t.integer :max_price
      t.references :category, index: true

      t.timestamps
    end
  end
end
