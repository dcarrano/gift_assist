module Api
  module V1
    class GiftsController < ApplicationController

      def index
        render json: Gift.all
      end

      def show

      end

    end
  end
end
