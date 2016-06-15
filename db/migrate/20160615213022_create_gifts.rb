class CreateGifts < ActiveRecord::Migration[5.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :url
      t.decimal :price
      t.integer :priority
      t.references :event, foreign_key: true
      t.references :recipient, foreign_key: true
    end
  end
end
