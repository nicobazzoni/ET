module SpaceshipsHelper
    def spaceship(alien)
        if alien.spaceship
          alien.spaceship.name
        else
          link_to "Edit #{alien.name} to add a Spaceship!", edit_alien_path(alien)
        end
      end
end