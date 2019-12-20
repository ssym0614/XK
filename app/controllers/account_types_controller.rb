class AccountTypesController < ApplicationController
    def new
        @account_type = AccountType.new
    end

    def create
        @account_type = AccountType.new(account_type_params)
        if @account_type.save
            redirect_to '/welcome/index'
        else
            render 'new'
        end
    end

    private
    def account_type_params
        params.require(:account_type).permit(:name)
    end
end
