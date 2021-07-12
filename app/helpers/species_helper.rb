module SpeciesHelper

   def species_image
   
            if @species.name.include?('Tall Grey') 
        "<div class='bodyspecies'>"
        image_url("logos/bigAlien.jpg") 
        end
        "</div>"


        (if @species.name.include?('Reptilian') 
        "<div class='reptilian'>"
        image_url("logos/reptile.jpg") 
        end)
        "</div>"


        (if @species.name.include?('Xenomorph') 
            "<div class='Xenopmorph'>"
        image_url("logos/xenomorph.jpg") 
        end)
        "</div>"

        (if @species.name.include?('Insectoid') 
        "<div class='Insectoid'>"
        image_url('logos/insect.jpg') 
        end) 
        "</div>"
        
        (if @species.name.include?('Plasma Being') 
        "<div class='plasma_being'>"
        image_url('logos/psychodelic-meditation.jpg') 
        end) 
        "</div>"
    end
end

