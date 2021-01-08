class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string :cord, null: false
      t.integer :prefecture_id, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :building
      t.string :tel, null: false
      t.references :buy_record, null: false
      

      t.timestamps
    end
  end
end
