class ChangePidToString < ActiveRecord::Migration
  def change
    change_table "search_results" do |t|
      t.remove :pid
      t.string :pid
      t.index :pid
    end
  end
end
