class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])
  end
private
  def user_params
    params.require(:user).permit(:profile_image)
  end

end
