require "test_helper"

class PlanetTest < ActiveSupport::TestCase
  test "should not save a project without a name" do
    planet = Planet.new
    planet.name = " HOLA "
    

    assert_not planet.save, "Saved the planet without a name"
  end
end
