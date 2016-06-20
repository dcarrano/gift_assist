module Api
  module V1
    class RecipientsController < ApplicationController

      before_action :find_recipient, only: [:show, :delete]

      def index
        render json: current_user.recipients.includes(:gifts, :events), include: ['gifts'], include: ['events']
      end

      def show
        render json: @recipient
      end

      def create
        Recipient.create(create_params)
      end

      def destroy
        @recipient.destroy
      end

      private

      def find_recipient
        @recipient = current_user.recipients.find(params[:id])
      end

      def create_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:name, :relationship])
      end

    end
  end
end
