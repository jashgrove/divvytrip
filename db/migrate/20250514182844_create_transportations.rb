class CreateTransportations < ActiveRecord::Migration[7.1]
  def change
    create_table :transportations do |t|
      t.string :mode
      t.string :origin
      t.string :destination
      t.datetime :start_date
      t.datetime :end_date
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
