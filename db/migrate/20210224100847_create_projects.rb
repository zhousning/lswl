class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.date :start
    
      t.date :end
    
      t.string :state,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :user
    

      t.timestamps null: false
    end
  end
end
