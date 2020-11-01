class MypagesController < ApplicationController
   
    def edit
    end

    def update
        current_user.update!(user_params)
        redirect_to user_path(current_user)
    end

    private
    def user_params
        params.require(:user).permit(:role, :description, :user_url, :profile_image)
    end
end
