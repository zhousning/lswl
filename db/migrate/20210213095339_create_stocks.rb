class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
    
      t.integer :count,  null: false, default: Setting.systems.default_num 
    
      t.string :position,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :ctg_mtrl
    
      t.references :user
    

      t.timestamps null: false
    end
  end
end
