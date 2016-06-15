module Api
  module V1
    class EventsController < ApplicationController

      def index
        render json: Event.includes(:gifts, :recipients), include: ['gifts'], include: ['recipients']
      end

      def show

      end

    end
  end
end
