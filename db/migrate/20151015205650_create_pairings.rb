class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
    	t.integer :menu_id
    	t.integer :item_id

    	t.timestamps null:false
    end
  end
end
