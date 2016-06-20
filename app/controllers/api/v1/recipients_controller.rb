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
        recipient = Recipient.find_by(name: recipient_name[:name])
        if recipient
          recipient.update(recipient_name)
        else
          new_recipient = Recipient.new(recipient_params)
          new_recipient.user = current_user
          new_recipient.save
        end
      end

      def destroy
        @recipient.destroy
      end

      private

      def find_recipient
        @recipient = current_user.recipients.find(params[:id])
      end

      def recipient_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:name, :relationship, :events])
      end

      def recipient_name
        ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:name, :events])
      end

    end
  end
end
