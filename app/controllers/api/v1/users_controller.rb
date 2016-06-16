module Api
  module V1
    class UsersController < ApplicationController

      def index
        render json: User.includes(:recipients, :events), include: ['recipients'], include: ['events']
      end

      def show
        user = User.find(params[:id])
        render json: user
      end

    end
  end
end
