class CreateOutputItems < ActiveRecord::Migration
  def change
    create_table :output_items do |t|

    
      t.integer :count,  null: false, default: Setting.systems.default_num 
    
      t.references :retrieval

      t.references :stock
    

      t.timestamps null: false
    end
  end
end
