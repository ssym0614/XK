class TransactionCategoriesController < ApplicationController
    def new
        @transaction_category = TransactionCategory.new
    end

    def create
        @transaction_category = TransactionCategory.new(transaction_category_params)
        if @transaction_category.save
            redirect_to '/welcome/index'
        else
            render 'new'
        end
    end

    private
    def transaction_category_params
        params.require(:transaction_category).permit(:name, :account_type_id)
    end
end
