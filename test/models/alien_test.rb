require "test_helper"

class AlienTest < ActiveSupport::TestCase
test "should not save a project without a name" do
    alien = Alien.new
    alien.species_name = "Reptilian"
    alien.psychic = "true"
    alien.spaceship_name = "TR-3B"
    assert_not alien.save, "Saved the alien without a title"
  end
end