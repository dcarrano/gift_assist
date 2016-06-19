module Api
  module V1
    class EventsController < ApplicationController

      def index
        render json: current_user.events.order('date').includes(:gifts, :recipients), include: ['gifts'], include: ['recipients']
      end

      def show
        event = current_user.events.find(params[:id])
        render json: event
      end

      def create
        event = Event.new(event_params)
        event.user = current_user
        event.save
        render json: event
      end

      private

      def event_params
        params.require(:data).require(:attributes).permit(:title, :description, :date)
      end
    end
  end
end
