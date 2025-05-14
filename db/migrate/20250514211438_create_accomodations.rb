class CreateAccomodations < ActiveRecord::Migration[7.1]
  def change
    create_table :accomodations do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :name
      t.string :location
      t.datetime :check_in
      t.datetime :check_out
      t.decimal :cost, precision: 10, scale: 2
      t.timestamps
    end
  end
end
