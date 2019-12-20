class AccountTypesController < ApplicationController

    private
    def account_type_params
        params.require(:account_type).permit(:name)
    end
end
