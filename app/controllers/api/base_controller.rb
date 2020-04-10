# frozen_string_literal: true

module Api
  class BaseController < ActionController::API
    def render_not_found
      error_object = { errors: ['Record not found'] }
      render(json: error_object, status: :internal_server_error) && return
    end

    def render_save_error(obj)
      error_object = {
        errors: obj.errors.full_messages
      }

      render json: error_object, status: :internal_server_error
    end

    def render_with(object, serializer_class)
      render json: serializer_class.new(object).serialized_json
    end
  end
end
