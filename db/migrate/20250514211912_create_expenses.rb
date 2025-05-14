class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :paid_by_user, null: false, foreign_key: true
      t.references :expenseable, null: false, foreign_key: true
      t.text :description
      t.decimal :amount
      t.date :due_date
      t.string :currency, null: false

      t.timestamps
    end
    add_index :expenses, %i[trip_id paid_by_user_id], unique: true
  end
end
