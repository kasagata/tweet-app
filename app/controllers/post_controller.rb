class PostController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
  
    # GET /post
    def index
        @posts = Post.all
    end

    # GET /post/new
    def new
        @post = Post.new
    end

    # GET /post/1
    def show
    end

    # GET /post/1/edit
    def edit
    end

    # POST /post
    def create
        @post = Post.new(post_params)

        if @post.save
        redirect_to @post, notice: 'Post was successfully created.'
        else
        render :new
        end
    end

    # PATCH/PUT /post/1
    def update
        if @post.update(post_params)
            redirect_to @post, notice: 'post was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        respond_to do |format|
        format.html { redirect_to @post, notice: "Blog was successfully destroyed." }
        end
    end
    private
    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:content)
    end
end