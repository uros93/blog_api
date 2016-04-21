class API::CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :update, :destroy]
  

  # GET /comments
  # GET /comments.json
  def index

    @comments = @post.comments.all

    render json: @comments
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    render json: @comment
  end

  # POST /comments
  # POST /comments.json
  def create

    @comment = @post.comments.create(:author => params[:author], :content => params[:content])

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update

    if @comment.update(:author => params[:author], :content => params[:content])
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy

    head :no_content
  end

  private

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def set_post
       @post = Post.find(params[:post_id])
    end
    
end
