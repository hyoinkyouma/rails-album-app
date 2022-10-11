class AddImgurlToAlbums < ActiveRecord::Migration[7.0]
  def change
    add_column :albums, :img_url, :string
    add_column :albums, :yt_url, :string
  end
end
