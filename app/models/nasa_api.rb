class NasaApi < ApplicationRecord
    def self.get_api_info 
        "https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}"
        JSON.parse Net::HTTP.get(URI(
            "https://api.nasa.gov/planetary/apod?api_key=#{ENV['NASA_API_KEY']}"
            ))
    end

    def self.get_nasa_pics
        "https://images-api.nasa.gov/apod?api_key#{ENV['NASA_API_KEY']}"
    end
end
