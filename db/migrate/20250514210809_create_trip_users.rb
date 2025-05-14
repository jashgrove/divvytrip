class CreateTripUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_users do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role
      t.timestamps
    end
    add_index :trip_users, %i[trip_id user_id], unique: true

  end
end
