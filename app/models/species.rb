class Species < ApplicationRecord
    has_many :aliens
    has_many :alien_planets
    has_many :planets, through: :alien_planets
    accepts_nested_attributes_for :alien_planets
    validates :power_level, numericality: { greater_than: 0, less_than_or_equal_to: 10 }
    def alien_planet_attributes=(alien_planet_attributes)
        alien_planet_attributes.values.each do |alien_planet_attribute|
          alien_planet = AlienPlanet.find_or_create_by(alien_planet_attribute)
          self.alien_planet << alien_planet
        end
      end

      def planet_name
        self.planet ? planet.name : ""
      end
    
      def planet_name=(p_name)
        self.planet = Planet.find_or_create_by(name: p_name)
      end


      def alien_planet_name
        self.alien_planet ? alien_planet.name : ""
      end
    
      def alien_planet_name=(a_name)
        self.alien_planet = AlienPlanet.find_or_create_by(name: a_name)
      end

     
end
