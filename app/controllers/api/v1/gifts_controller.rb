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
        Gift.joins('INNER JOIN events ON gifts.event_id=events.id INNER JOIN users ON events.user_id = users.id').where('users.id = ?', current_user.id).order('gifts.priority')
      end
    end
  end
end
