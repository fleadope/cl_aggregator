class CreateCategoriesSearchesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :categories, :searches do |t|
      t.index [:category_id, :search_id]
      t.index [:search_id, :category_id]
    end
  end
end
