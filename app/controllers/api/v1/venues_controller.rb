module Api
  module V1

    class VenuesController < ApplicationController
      respond_to :json

      def index
        @venues = Venue.all
      end

      def show
        @venue = Venue.find(venue_params[:id])
      end

      private
      def venue_params
        params.permit(:id)
      end

    end
  end
end
