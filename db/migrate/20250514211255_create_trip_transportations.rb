class CreateTripTransportations < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_transportations do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :transportation, null: false, foreign_key: true
      t.timestamps
    end
    add_index :trip_transportations, %i[trip_id transportation_id], unique: true

  end
end
