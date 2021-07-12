class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]
    before_action :set_user, only: %i[ show edit update destroy ]
  
    # GET /posts or /posts.json
    def index
      @posts = Post.all
    end
  
    # GET /posts/1 or /posts/1.json
    def show
    end
  
    # GET /posts/new
    def new
      @post = Post.new
    end
  
    # GET /posts/1/edit
    def edit
    end
  
    # POST /posts or /posts.json
    def create
      @post = Post.new(post_params)
  
      
        if @post.save
          redirect_to @post
        else
          render :new
        end
      
    end
  
    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      
        if @post.update(post_params)
          redirect_to @post, notice: "Post was successfully updated."
          
         else
         render :edit
         end
      
      
    end
  
    # DELETE /posts/1 or /posts/1.json
    def destroy
      @post.destroy
       redirect_to posts_url, notice: "Post was successfully destroyed." 
    end
      
    
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end
      def set_user
        @user = User.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :content, :user_id)
      end
    
  end