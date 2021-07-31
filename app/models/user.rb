class User < ApplicationRecord
    
    has_many :aliens, dependent: :destroy
    has_many :planets, dependent: :destroy
    
    has_one_attached :avatar
    
    has_secure_password
    before_save { self.email = email.downcase }
    validates :name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
  
    include Filterable

    def self.find_or_create_from_google(user_info)
      find_or_create_by(email: user_info[:email]) do |user|
        user.username = user_info[:name]
        user.profile_pic = user_info[:image]
        user.password = SecureRandom.hex
      end
    end
    
    def alien_name
        self.aliens ? aliens.name : ""
      end
    
      def alien_name=(a_name)
        self.aliens = current_user.aliens.find_or_create_by(name: a_name)
      end

      def planet_name
        self.planet ? planet.name : ""
      end
    
      def planet_name=(p_name)
        self.planet = Planet.find_or_create_by(name: p_name)
      end
      

      def self.search(search)
        where("name LIKE ?", "%#{search}%") 
       
      end

     
  end
