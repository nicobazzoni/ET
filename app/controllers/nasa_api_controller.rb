class NasaApiController < ApplicationController
    def index
        @nasa_info = NasaApi.get_api_info
        @media_type_is_video = @nasa_info['media_type'].eql?('video')

    end

    def nasa_images
        @nasa_images = NasaApi.get_nasa_pics
        @media_type_is_video = @nasa_images['media_type'].eql?('video')
    end
end
