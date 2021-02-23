class CreateCtgMtrls < ActiveRecord::Migration
  def change
    create_table :ctg_mtrls do |t|
    
      t.string :idno,  null: false, default: Setting.systems.default_str
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.string :pet_name,  null: false, default: Setting.systems.default_str
    
      t.string :model_no,  null: false, default: Setting.systems.default_str

      t.string :unit,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :ctg_secd
    

      t.timestamps null: false
    end
  end
end
