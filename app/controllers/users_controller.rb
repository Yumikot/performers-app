class UsersController < ApplicationController
  before_action :user_params

  def index
    @users= User.all  
  end


  def show
    @user = User.find(params[:id])
  end
 

private
  def user_params
    params.permit(:username, :email)
  end

end
