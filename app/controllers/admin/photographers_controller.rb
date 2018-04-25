class Admin::PhotographersController < ApplicationController
  before_action :set_photographer, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  def index
    @photographers = Photographer.all
  end

  def new
    @photographer = Photographer.new  
  end

  def show
  end

  def edit
  end
  
  def create
    @photographer = Photographer.new(photographer_params)
    respond_to do |format|
      if @photographer.save
        format.html { redirect_to admin_photographer_path(@photographer), notice: 'Photographer was successfully created.' }
        format.json { render :show, status: :created, location: @photographer }
      else
        format.html { render :new }
        format.json { render json: @photographer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @photographer.update(photographer_params)
        format.html { redirect_to admin_photographer_path(@photographer), notice: 'Photographer was successfully updated.' }
        format.json { render :show, status: :ok, location: @photographer }
      else
        format.html { render :edit }
        format.json { render json: @photographer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @photographer.destroy
    respond_to do |format|
      format.html { redirect_to admin_photographers_url, notice: 'Photographer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_photographer
      @photographer = Photographer.find(params[:id])
    end

    def photographer_params
      params.require(:photographer).permit(:first_name, :last_name, :contact, :address, :city, :state, :country, :zipcode, :facebook_page_url, :linkedin_page_url, :google_plus_page_url, :twitter_page_url, :experience_of_photography, :about, :latitude, :longitude, :username)
    end
end