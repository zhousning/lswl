class CreateRetrievals < ActiveRecord::Migration
  def change
    create_table :retrievals do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.date :outdate
    
      t.string :dept,  null: false, default: Setting.systems.default_str
    
      t.string :receiver,  null: false, default: Setting.systems.default_str
    

    
      t.string :sign,  null: false, default: Setting.systems.default_str
      t.string :signer,  null: false, default: Setting.systems.default_str
    

      t.string :state
    

    
      t.references :user
    

      t.timestamps null: false
    end
  end
end
