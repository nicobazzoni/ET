module SpeciesHelper
    def species_image
      species_hash = {
        'Tall Grey': {
          class: 'bodyspecies',
          image_url: 'logos/bigAlien.jpg'
        },
        'Reptilian': {
          class: 'reptilian',
          image_url: 'logos/reptile.jpg'
        },
        'Xenomorph': {
          class: 'xenomorph',
          image_url: 'logos/xenomorph.jpg'
        },
        'Insectoid': {
          class: 'insectoid',
          image_url: 'logos/insect.jpg'
        
        },
        'Plasma Being': {
          class: 'plasma_being',
          image_url: 'logos/psychodelic-meditation.jpg'
        }
      }
  ​
      @class = ''
      @image_url = ''
      
      species_hash.keys.each do |s|
        if @species.name.include?(s.to_s)
          @class = species_hash[s][:class]
          @image_url = species_hash[s][:image_url]
          break
        end
      end
      
    end
  end

