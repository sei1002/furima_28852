class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name  ,null:false
      t.string :description  ,null:false
      t.string :image  ,null:false
      t.integer :category_id  ,null:false
      t.integer :price  ,null:false
      t.integer :condition_id  ,null:false
      t.integer :delv_fee_id  ,null:false
      t.integer :delv_time_id  ,null:false
      t.integer :prefectures_id  ,null:false
      t.references :user  ,foreign_key: true
      t.timestamps
    end
  end
end
