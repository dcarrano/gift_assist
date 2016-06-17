module Api
  module V1
    class RecipientsController < ApplicationController

      def index
        render json: current_user.recipients.includes(:gifts, :events), include: ['gifts'], include: ['events']
      end

      def show
        recipient = current_user.recipients.find(params[:id])
        render json: recipient
      end

    end
  end
end
