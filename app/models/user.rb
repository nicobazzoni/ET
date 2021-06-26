class User < ApplicationRecord
    
    has_many :aliens, dependent: :destroy
    has_many :planets, dependent: :destroy
    has_secure_password
    before_save { self.email = email.downcase }
    validates :name, presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }


    def alien_name
        self.aliens ? aliens.name : ""
      end
    
      def alien_name=(a_name)
        self.aliens = current_user.aliens.find_or_create_by(name: a_name)
      end
  end
