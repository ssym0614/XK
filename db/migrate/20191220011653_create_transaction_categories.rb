class CreateTransactionCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_categories do |t|
      t.string :name
      t.references :account_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
