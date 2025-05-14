class CreateTripEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_events do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.timestamps
    end
    add_index :trip_events, %i[trip_id event_id], unique: true
  end
end
