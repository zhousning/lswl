class CreateWareHouses < ActiveRecord::Migration
  def change
    create_table :ware_houses do |t|
      t.string :name,  null: false, default: Setting.systems.default_str
      t.string :sign,  null: false, default: Setting.systems.default_str
    
      t.date :ware_date
    
      t.text :desc

      t.string :state
    

    

    

    
      t.references :user
    

      t.timestamps null: false
    end
  end
end
