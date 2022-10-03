class CreateSents < ActiveRecord::Migration[6.0]
  def change
    create_table :sents do |t|
      t.string :code                , null: false             
      t.integer  :place_id  , null: false             
      t.string :city                 , null: false             
      t.string :street_address       , null: false             
      t.string :building                                   
      t.string :phone_number       , null: false             
      # t.references  :purchase_history ,null: false ,foreign_key: true          
      
      t.timestamps

      # belongs_to :purchase_history

    end
  end
end
