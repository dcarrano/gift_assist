module Api
  module V1
    class GiftsController < ApplicationController

      def index
        render json: user_gifts
      end

      def show
        gift = user_gifts.find(params[:id])
        render json: gift
      end

      private

      def user_gifts
        gift_array = []
        current_user.recipients.each do |recipient|
          recipient.gifts.each do |gift|
            gift_array << gift
          end
        end
      gift_array
      end
    end
  end
end
