# frozen_string_literal: true

# This file contains api versioning constraints, maybe in the future we'll need a v2
require "api_constraints"

Rails.application.routes.draw do
  scope module: :api,
        defaults: { format: :json },
        path: "" do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      resources :links, only: %i[index show fetch create]

      root to: "links#index"
    end
  end
end
