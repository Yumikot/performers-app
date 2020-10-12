class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
    
    def index   
      @posts = Post.all.order(id: :asc)
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

    private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :content, :image, :category_id)
      end
  end

