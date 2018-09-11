class CreateArtworksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, presence: true
      t.string :image_url, presence: true
      t.string :artist_id, presence: true
      
      t.timestamps
    end
    
    add_index :artworks, [:title, :artist_id], unique: true
    add_index :artworks, :artist_id
    
  end
end
