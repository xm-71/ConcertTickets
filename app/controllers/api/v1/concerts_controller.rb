module Api
  module V1

    class ConcertsController < ApplicationController
      respond_to :json

      def index
        @concerts = Concert.all
      end

      def show
        @concert = Concert.find(concert_params[:id])
      end

      private
      def concert_params
        params.permit(:id)
      end

    end
  end
end
