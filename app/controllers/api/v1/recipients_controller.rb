module Api
  module V1
    class RecipientsController < ApplicationController

      def index
        render json: Recipient.includes(:gifts, :events), include: ['gifts'], include: ['events']
      end

      def show
        recipient = Recipient.find(params[:id])
        render json: recipient
      end

    end
  end
end
