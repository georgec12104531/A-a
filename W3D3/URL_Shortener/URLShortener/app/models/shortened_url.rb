class ShortenedUrl < ApplicationRecord
  
  
  validates :long_url, :short_url, presence: true
  
  belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: 'User'
  
  def self.random_code
  
    while true 
      short = SecureRandom::urlsafe_base64
      
      if ShortenedUrl.exists?(short_url: short)
        next 
      else 
        return short
      end
    end
    
  end
  
  def self.create_new_entry(user, long_url)
    short_url = ShortenedUrl.random_code
    
    ShortenedUrl.create!(long_url: long_url, short_url: short_url, user_id: user.id)
  end
  
  
end 