class CreateOutputItems < ActiveRecord::Migration
  def change
    create_table :output_items do |t|

      t.integer :input_item_id

      t.string :input_item_name ,  null: false, default: Setting.systems.default_str

      t.string :input_item_idno ,  null: false, default: Setting.systems.default_str
    
      t.integer :count,  null: false, default: Setting.systems.default_num 
    

    

    

    
      t.references :retrieval
    

      t.timestamps null: false
    end
  end
end
