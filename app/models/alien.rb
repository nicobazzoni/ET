class Alien < ApplicationRecord
    belongs_to :spaceship, optional: true
    belongs_to :species, optional: true
    validates :threat_level, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
    validates :name, :threat_level, :origin, presence: true
  
    has_many_attached :images, :dependent => :destroy
    
 

    
    
    
    
    def spaceship_name
        self.spaceship ? spaceship.name : ""
      end
    
      def spaceship_name=(s_name)
        self.spaceship = Spaceship.find_or_create_by(name: s_name)
      end

      def species_name
        self.species ? species.name : ""
      end
    
      def species_name=(s_name)
        self.species = Species.find_or_create_by(name: s_name)
      end


      def planet_attributes=(planet_attributes)
        planet_attributes.values.each do |planet_attribute|
          planet = Planet.find_or_create_by(planet_attribute)
          self.planet << planet
        end
      end
end