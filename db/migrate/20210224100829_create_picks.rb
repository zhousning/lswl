class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.date :pick_date
    
      t.string :signer,  null: false, default: Setting.systems.default_str
    
      t.string :dept,  null: false, default: Setting.systems.default_str
    
      t.string :receiver,  null: false, default: Setting.systems.default_str
    
      t.string :state,  null: false, default: Setting.systems.default_str
    
      t.text :desc
    

    
      t.string :attch,  null: false, default: Setting.systems.default_str
    

    

    
      t.references :project
    

      t.timestamps null: false
    end
  end
end
