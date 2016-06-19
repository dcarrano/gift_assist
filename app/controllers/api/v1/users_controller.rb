module Api
  module V1
    class UsersController < ApplicationController

    skip_before_action :authenticate, only: [:create]

      def index
        render json: User.includes(:recipients, :events), include: ['recipients'], include: ['events']
      end

      def me
        # user = User.find(params[:id])
        render json: current_user
      end

      def create
        User.create(create_params)
      end

      private

      def create_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:email, :password, :password_confirmation])
      end
    end
  end
end
