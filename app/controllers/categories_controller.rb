class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]
  before_action :user_admin
 
  def index   
    @categories = Category.all
  end  
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.create!(category_params)
    if @category.save
      redirect_to categories_path
    else
    render 'new'   
    end
  end

  def edit
  end

  def update
    @category.update!(category_params)
    redirect_to categories_path
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def user_admin
      redirect_to root_path unless current_user.admin
    end

end