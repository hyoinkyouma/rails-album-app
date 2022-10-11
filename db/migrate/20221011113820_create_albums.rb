class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :artist
      t.string :description
      t.string :year
      t.text :songs, array: true, default: []

      t.timestamps
    end
  end
end
