class CreateRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :relationship
      t.references :user, foreign_key: true
    end
  end
end
