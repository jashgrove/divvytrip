class CreateTransportations < ActiveRecord::Migration[7.1]
  def change
    create_table :transportations do |t|
      t.references :trips, null: false, foreign_key: true
      t.string :mode, null: false
      t.string :origin
      t.string :destination
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end
