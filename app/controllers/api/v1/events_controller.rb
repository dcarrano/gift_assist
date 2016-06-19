module Api
  module V1
    class EventsController < ApplicationController

      before_action :find_event, only: [:show, :delete]

      def index
        render json: current_user.events.order('date').includes(:gifts, :recipients), include: ['gifts'], include: ['recipients']
      end

      def show
        render json: @event
      end

      def create
        event = Event.new(event_params)
        event.user = current_user
        event.save
        render json: event
      end

      def destroy
        @event.destroy
      end

      private

      def event_params
        params.require(:data).require(:attributes).permit(:title, :description, :date)
      end

      def find_event
        @event = current_user.events.find(params[:id])
      end
    end
  end
end
