class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :text, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :fee_id, null: false
      t.integer :prefectures_id, null: false
      t.integer :schedule_id, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
