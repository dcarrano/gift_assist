class CreateEventRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :event_recipients do |t|
      t.references :event, foreign_key: true
      t.references :recipient, foreign_key: true
    end
  end
end
