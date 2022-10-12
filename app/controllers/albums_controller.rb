class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show
    @album = Album.find params[:id]
  end

  def edit
    @album = Album.find params[:id]
  end

  def update
    puts params[:id]
    @album = Album.find params[:id]
    if @album.update(album_params) && @album.update(:songs => params[:songs])
      redirect_to "/#{params[:id]}"
    else
      render :edit
    end


  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.songs = params[:songs]

    if @album.save
      redirect_to albums_path
    else
      redirect_to new_album_path
    end
  end

  def delete
    @album = Album.find params[:id]
    @album.destroy
    redirect_to albums_path
  end

  private
  def album_params
    params.permit(:title, :description, :artist, :year, :img_url, songs:[])
  end
end
