class AddFailuresToSearch < ActiveRecord::Migration
  def change
    change_table "searches" do |t|
      t.integer :failures, default: 0
      t.text    :failure_detail
    end
  end
end
