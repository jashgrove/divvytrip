class CreateTransportationUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :transportation_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :transportation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
