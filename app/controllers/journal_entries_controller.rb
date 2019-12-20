class JournalEntriesController < ApplicationController

    def new
        @journal_entry = JournalEntry.new
    end

    def create
        @journal_entry = JournalEntry.new(journal_entry_params)
        if @journal_entry.save
            redirect_to '/welcome/index'
        else
            render 'new'
        end
    end

    private
    def journal_entry_params
        params[:journal_entry][:cents] = params[:journal_entry][:cents1]
        params.require(:journal_entry).permit(:accrued, :item, :transaction_category1_id, :transaction_category2_id, :cents, :note)
    end
    
end
