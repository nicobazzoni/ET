class Spaceship < ApplicationRecord
    has_many :aliens
    has_many_attached :images, :dependent => :destroy
end
