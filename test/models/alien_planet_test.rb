require "test_helper"

class AlienPlanetTest < ActiveSupport::TestCase
  test "should not save a project without a name" do
    alien_planet = AlienPlanet.new
    alien_planet.species_name = "Reptilian"
   
    assert_not alien_planet.save, "Saved the alien planet without a name"
  end
end
