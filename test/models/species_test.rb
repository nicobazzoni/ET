require "test_helper"

class SpeciesTest < ActiveSupport::TestCase
  test "should not save a project without a power level" do
    species = Species.new
    species.name = " Xenomorph "
    

    assert_not species.save, "Saved the species without a power level"
  end
end
