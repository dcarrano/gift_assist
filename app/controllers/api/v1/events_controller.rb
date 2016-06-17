module Api
  module V1
    class EventsController < ApplicationController

      def index
        render json: current_user.events.includes(:gifts, :recipients), include: ['gifts'], include: ['recipients']
      end

      def show
        event = current_user.events.find(params[:id])
        render json: event
      end

    end
  end
end
