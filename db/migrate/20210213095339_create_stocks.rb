class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
    
      t.float :unit_price,  null: false, default: Setting.systems.default_num 

      t.integer :count,  null: false, default: Setting.systems.default_num 

      t.float :total_price,  null: false, default: Setting.systems.default_num 

      t.integer :total_input,  null: false, default: Setting.systems.default_num 

      t.float :total_unit_price,  null: false, default: Setting.systems.default_num 
    
      t.string :position,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :ctg_mtrl
    
      t.references :user
    

      t.timestamps null: false
    end
  end
end
