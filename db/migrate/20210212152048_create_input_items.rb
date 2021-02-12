class CreateInputItems < ActiveRecord::Migration
  def change
    create_table :input_items do |t|
    
      t.float :unit_price,  null: false, default: Setting.systems.default_num 
    
      t.float :count,  null: false, default: Setting.systems.default_num 
    
      t.float :total_price,  null: false, default: Setting.systems.default_num 
    

    

    

    
      t.references :ware_house
    
      t.references :ctg_mtrl
    

      t.timestamps null: false
    end
  end
end
