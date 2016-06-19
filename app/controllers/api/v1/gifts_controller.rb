module Api
  module V1
    class GiftsController < ApplicationController

      before_action :find_gift, only: [:show, :delete]

      def index
        render json: user_gifts
      end

      def show
        render json: @gift
      end

      def create
        Gift.create(create_params)
      end

      def destroy
        @gift.destroy
      end

      private

      def user_gifts
        Gift.joins('INNER JOIN events ON gifts.event_id=events.id INNER JOIN users ON events.user_id = users.id').where('users.id = ?', current_user.id).order('gifts.priority')
      end

      def find_gift
        @gift = user_gifts.find(params[:id])
      end

      def create_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:name, :url, :price, :priority])
      end
    end
  end
end
