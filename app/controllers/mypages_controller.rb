class MypagesController < ApplicationController
   
    def edit
    end

    def update
        @user.update!(user_params)
        redirect_to user_path
    end

    private
    def user_params
        params.require(:user).permit(:role, :description)
    end
end
