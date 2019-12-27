# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create Account Type
AccountType.create([{name: "ASSETS", debit: true}, {name: "LIABILITIES", debit: false},
    {name: "EQUITY", debit: false}, {name: "REVENUES", debit: false}, {name: "EXPENSES", debit:true}])

# find ids of created account types, then seed transaction categories
assets_id = AccountType.find_by(name: "ASSETS").id
liabilities_id = AccountType.find_by(name: "LIABILITIES").id
equity_id = AccountType.find_by(name: "EQUITY").id
revenues_id = AccountType.find_by(name: "REVENUES").id
expenses_id = AccountType.find_by(name: "EXPENSES").id

TransactionCategory.create([
    {name: "Cash",account_type_id: assets_id},
    {name: "Bank",account_type_id: assets_id},
    {name: "Accounts Receivable",account_type_id: assets_id},
    {name: "Prepaid Expenses",account_type_id: assets_id},
    {name: "Ski Trip Fund",account_type_id: assets_id},
    {name: "Accounts Payable",account_type_id: liabilities_id},
    {name: "Unearned Revenue",account_type_id: liabilities_id},
    {name: "Retained Earnings",account_type_id: equity_id},
    {name: "Service Revenue",account_type_id: revenues_id},
    {name: "Other Revenues",account_type_id: revenues_id},
    {name: "Cost of Services",account_type_id: expenses_id},
    {name: "Administrative Expenses",account_type_id: expenses_id},
    {name: "Other Expenses",account_type_id: expenses_id}
    ])