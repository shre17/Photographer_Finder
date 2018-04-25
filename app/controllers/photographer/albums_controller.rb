class Photographer::AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  layout 'photographer'

  def index
    @albums = Album.all
  end

  def show
  end

  def upload_photographer_album_image
    @albums = Album.find(params[:upload_images][:album_id])
    @image = @albums.images.build(image: params[:upload][:image])
    if @image.save!
      respond_to do |format|
        format.json{ render :json => @image }
      end
    end
  end

  def remove_photographer_album_image
   @image = Album.find(params[:id])
   if @image.destroy
    render json: { message: "file delete from server"}
   else
    render json: {message: @image.errors.full_messages.join(", ") }
   end
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(album_params)
    respond_to do |format|
      if @album.save
        format.html { redirect_to photographer_album_path(@album), notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to photographer_album_path(@album), notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to photographer_albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:name, :description, :photographers_id)
    end
end