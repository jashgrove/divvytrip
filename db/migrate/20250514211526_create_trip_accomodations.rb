class CreateTripAccomodations < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_accomodations do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :accomodation, null: false, foreign_key: true
      t.timestamps
    end
    add_index :trip_accomodations, %i[trip_id accomodation_id], unique: true
  end
end
