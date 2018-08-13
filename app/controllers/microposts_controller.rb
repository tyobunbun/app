# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy]
  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/1
  # GET /microposts/1.json
  def show
  end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
    @categories = Category.all.pluck(:name, :id)
  end

  # GET /microposts/1/edit
  def edit
    @categories = Category.all.pluck(:name, :id)
  end

  # POST /microposts
  # POST /microposts.json
  def create
    # @micropost = Micropost.new(micropost_params)
    # @micropost.user_id = current_user.id
    @micropost = current_user.microposts.build(micropost_params)
    respond_to do |format|
      if @micropost.save
        format.html do
          redirect_to @micropost, notice: t('created', name: 'Micropost')
        end
        format.json { render :show, status: :created, location: @micropost }
      else
        format.html { render :new }
        format.json do
          render json: @micropost.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end
  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
    respond_to do |format|
      if @micropost.update(micropost_params)
        format.html { redirect_to @micropost, notice: t('updated', name: 'Micropost')}
        format.json { render :show, status: :ok, location: @micropost }
      else
        format.html { render :edit }
        format.json { render json: @micropost.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy if ifcurrentuser
    respond_to do |format|
      format.html { redirect_to microposts_url, notice: t('destroyed', name: 'Micropost')}
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_micropost
    @micropost = Micropost.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def micropost_params
    params.require(:micropost).permit(:content, :image, category_ids: [])
  end

  def ifcurrentuser
    @micropost = current_user.microposts.find(params[:id])
  end
end
