class CreateCtgSecds < ActiveRecord::Migration
  def change
    create_table :ctg_secds do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :ctg_frst
    

      t.timestamps null: false
    end
  end
end
