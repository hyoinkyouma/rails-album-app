class AlbumsController < ApplicationController
  #TODO: TEST QUERY
  #TODO: YT PLAYLIST URL

  def query
    query = params[:query]
    return redirect_to "/" if query == "" || query == nil

    @albums = Album.where("title ILIKE ?", "%#{query}%")
      .or(Album.where("description ILIKE ?", "%#{query}%")
      .or(Album.where("array_to_string(songs, ',') ILIKE ?", "%#{query}%"))
      )
    render 'index'

  end

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
      redirect_to "/show/#{params[:id]}"
    else
      flash[:alert] = "Incomplete fields!"
      redirect_to "/edit/#{params[:id]}"
    end


  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to albums_path
    else
      flash[:alert] = "Incomplete fields!"
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
