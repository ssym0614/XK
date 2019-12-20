class AccountType < ApplicationRecord
    has_many :transaction_categories, dependent: :destroy
end
