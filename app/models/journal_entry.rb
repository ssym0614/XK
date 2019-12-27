class JournalEntry < ApplicationRecord

  attribute :dollars1, :float
  attribute :dollars2, :float
  attribute :total_debit, :float
  attribute :total_credit, :float
  validates :item, presence: true
  validates :dollars1, presence: true, format: {with: /\A-?\d+(?:\.\d{0,2})?\z/}
  validates :dollars2, presence: true, format: {with: /\A-?\d+(?:\.\d{0,2})?\z/}
  validate :debit_equals_credit
  belongs_to :transaction_category1, class_name: 'TransactionCategory'
  belongs_to :transaction_category2, class_name: 'TransactionCategory'

  after_initialize do |journal_entry|
    if not journal_entry.dollars1.nil? and not journal_entry.dollars2.nil?
      journal_entry.cents = (journal_entry.dollars1 * 100).to_i
      if journal_entry.cents != (journal_entry.dollars2 * 100).to_i
        journal_entry.inverted = true
      end
    elsif not journal_entry.cents.nil?  
      journal_entry.dollars1 = journal_entry.cents / 100.0
      if journal_entry.inverted
        journal_entry.dollars2 = journal_entry.cents * -1.0 / 100.0
      else
        journal_entry.dollars2 = journal_entry.cents / 100.0
      end
    end

    if not journal_entry.cents.nil?
      puts "calculating debit and credit"
      journal_entry.total_debit = 0
      journal_entry.total_credit = 0
      dollars1_debit = journal_entry.transaction_category1.account_type.debit?
      dollars2_debit = journal_entry.transaction_category2.account_type.debit?
      if dollars1_debit
        journal_entry.total_debit += journal_entry.dollars1
      else
        journal_entry.total_credit += journal_entry.dollars1
      end
      if dollars2_debit
        journal_entry.total_debit += journal_entry.dollars2
      else
        journal_entry.total_credit += journal_entry.dollars2
      end
    end
  end

  def calculate_amount(transaction_category)
    if transaction_category.id == self.transaction_category1_id
      dollars1
    elsif transaction_category.id == self.transaction_category2_id
      dollars2
    else
      0.00
    end
  end

  private
  def debit_equals_credit
    
    if transaction_category1.account_type.debit? == transaction_category2.account_type.debit?
      if dollars1 + dollars2 != 0
        errors.add(:dollars1, "debit must equal credit.")
      end
    else
      if dollars1 - dollars2 != 0
        errors.add(:dollars1, "debit must equal credit.")
      end
    end
  end

end
