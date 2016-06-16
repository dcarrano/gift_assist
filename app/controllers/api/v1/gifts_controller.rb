module Api
  module V1
    class GiftsController < ApplicationController

      def index
        render json: Gift.all
      end

      def show
        gift = Gift.find(params[:id])
        render json: gift
      end

    end
  end
end
