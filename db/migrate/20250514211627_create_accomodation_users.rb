class CreateAccomodationUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :accomodation_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :accomodation, null: false, foreign_key: true

      t.timestamps
    end
    add_index :accomodation_users, %i[user_id accomodation_id], unique: true
  end
end
