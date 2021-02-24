class CreatePickItems < ActiveRecord::Migration
  def change
    create_table :pick_items do |t|
    
      t.integer :count,  null: false, default: Setting.systems.default_num 
    

    

    

    
      t.references :pick
    
      t.references :stock
    

      t.timestamps null: false
    end
  end
end
