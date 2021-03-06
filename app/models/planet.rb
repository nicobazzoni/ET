   class Planet < ApplicationRecord
    belongs_to :user
    has_many :alien_planets
    has_many :species, through: :alien_planets
    
    validates :moons, numericality: { less_than_or_equal_to: 50 }
    validates :name, presence: true
    
    scope :many_moons, -> { where("moons > 25" ) }
    
    
    def alien_planet_name
        self.alien_planet ? alien_planet.name : ""
      end
    
      def alien_planet_name=(a_name)
        self.alien_planet = AlienPlanet.find_or_create_by(name: a_name)
      end

      def species_name
        self.species ? species.name : ""
      end
    
      def species_name=(s_name)
        self.species = Species.find_or_create_by(name: s_name)
      end


      def self.moon_number
         self.many_moons
      end
     

      
       

 
      def alien_attributes=(alien_attributes)
        alien_attributes.values.each do |alien_attribute|
          alien = Alien.find_or_create_by(alien_attribute)
          self.alien << alien
        end
      end
end
