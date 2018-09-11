# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ApplicationRecord
  
  validates :username, presence: true, uniqueness: true
  
  #artists
  has_many :artworks,
    primary_key: :id, 
    foreign_key: :artist_id, 
    class_name: 'Artwork'
  
  #viewer 
  has_many :artwork_shares, 
    primary_key: :id, 
    foreign_key: :viewer_id, 
    class_name: 'ArtworkShare'  
    
  
    
    

  
end
