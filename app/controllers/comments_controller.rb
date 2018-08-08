# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  def show; end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit; end

  # POST /comments
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(comment_params)
    redirect_to micropost_path(@micropost)
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = set_comment
    @comment.destroy
    redirect_to micropost_path(@micropost)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:name, :comment, :micropost_id)
  end
end
