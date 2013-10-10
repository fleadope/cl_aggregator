class CreateSearchResults < ActiveRecord::Migration
  def change
    create_table :search_results do |t|
      t.integer :pid
      t.string :date
      t.string :href
      t.string :text
      t.references :search, index: true

      t.timestamps
    end
    add_index :search_results, :href
    add_index :search_results, :pid, unique: true
  end
end
