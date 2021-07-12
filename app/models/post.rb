class Post < ApplicationRecord
    has_many :likes
    belongs_to :user


    def user_name
        self.user ? user.name : ""
      end
    
      def user_name=(u_name)
        self.user = User.find_or_create_by(name: u_name)
      end
end
