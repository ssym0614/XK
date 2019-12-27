class JournalEntriesController < ApplicationController

  def new
    @journal_entry = JournalEntry.new
  end

  def index
    @transaction_categories = TransactionCategory.all
    @journal_entries = JournalEntry.all
  end

  def create
    @journal_entry = JournalEntry.new(journal_entry_params)
    if @journal_entry.save
      redirect_to '/journal_entries'
    else
      render 'new'
    end
  end

  private
  def journal_entry_params
    params.require(:journal_entry).permit(:accrued, :item, :transaction_category1_id, :dollars1, :dollars2, :transaction_category2_id, :note)
  end

end
