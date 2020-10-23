class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
    
    def index   
      if params[:category_id].present?
        @posts=Post.where(category_id:params[:category_id]).order(created_at: :desc).page(params[:page]).per(8)
      else
        @posts=Post.page(params[:page]).per(8)
      end
    end
    
    def new
      @post = Post.new
    end

    def create
      @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to posts_path
          else
            render 'posts/new'
        end
    end

    def show
      @user = User.find_by(id: @post.user_id)
    end

    def edit
       
    end

    def update  
      @post.update!(post_params)
      redirect_to root_path
    end

    def destroy
      @post.destroy!
      redirect_to root_path 
    end

    def search
      @posts = Post.where('posts.content LIKE(?)', "%#{params[:search]}%").order(created_at: :desc)
      @search_result = "#{params[:search]}"
    end

    private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :content, :image, :username, :category_id, :name)
      end
  end

