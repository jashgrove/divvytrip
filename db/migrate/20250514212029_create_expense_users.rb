class CreateExpenseUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :expense_users do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.decimal :share
      t.boolean :paid
      t.datetime :paid_at

      t.timestamps
    end
    add_index :expense_users, %i[expense_id user_id], unique: true
  end
end
