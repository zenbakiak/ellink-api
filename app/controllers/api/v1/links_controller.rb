# frozen_string_literal: true

module Api
  module V1
    class LinksController < BaseController
      def index
        movements = Link.top_hits
        render json: LinkSerializer.new(movements).serialized_json
      end

      def show
        @movement = Link.find_by(movementname: params[:id])
        if @movement
          render json: LinkSerializer.new(@movement).serialized_json
        else
          render_not_found
        end
      end

      def create
        @movement = Link.new(movement_params)
        @movement.sender_id = User.current.id
        if @movement.save
          render json: LinkSerializer.new(@movement).serialized_json
        else
          render json: {
            status: 500,
            errors: @movement.errors.full_messages,
          }
        end
      end

      private

      def movement_params
        params
          .require(:movement)
          .permit(
            :id,
            :receiver_id,
            :amount,
            :ref,
            :concept,
            :created_at
          )
      end
    end
  end
end
