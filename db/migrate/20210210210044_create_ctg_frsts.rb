class CreateCtgFrsts < ActiveRecord::Migration
  def change
    create_table :ctg_frsts do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :user
    

      t.timestamps null: false
    end
  end
end
