class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_entries do |t|
      t.date :accrued
      t.string :item
      t.references :transaction_category1, null: true, foreign_key: {to_table: :transaction_categories}
      t.references :transaction_category2, null: true, foreign_key: {to_table: :transaction_categories}
      t.integer :cents
      t.text :note

      t.timestamps
    end
  end
end
