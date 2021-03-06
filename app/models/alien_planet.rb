class AlienPlanet < ApplicationRecord
    belongs_to :species, optional: true
    belongs_to :planet, optional: true
     validates :name, presence: true 
     validates_presence_of :species
     validates_presence_of :planet
  
    accepts_nested_attributes_for :planet
    accepts_nested_attributes_for :species

    def planet_name
        self.planet ? planet.name : ""
      end
    
      def planet_name=(p_name)
        self.planet = Planet.find_or_create_by(name: p_name)
      end

    
      
      
      def species_name
        self.species ? species.name : ""
      end
    
      def species_name=(s_name)
        self.species = Species.find_or_create_by(name: s_name)
      end
        def self.most_campaigns
          aliens = self.group(:planet_id).count
          planet_id = aliens.sort_by { |_, v| v}.last.first 
          @planet = Planet.find(planet_id)
        end
      
end
