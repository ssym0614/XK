class JournalEntry < ApplicationRecord
  validates :item, presence: true
  belongs_to :transaction_category1
  belongs_to :transaction_category2
end
