# frozen_string_literal: true

require 'devise'
require 'devise/acquirable/version'

Devise.add_module :acquirable, model: 'devise/acquirable/model', controller: :registrations

module Devise
  module Acquirable
    module Controller
      extend ActiveSupport::Concern

      included do
        before_action :set_tracking_cookies
      end

      def set_tracking_cookies
        cookies[:referring_url] =
          { value: request.env['HTTP_REFERER'], expires: 90.days.from_now } if cookies[:referring_url].blank?

        cookies[:landing_url] =
          { value: request.url, expires: 90.days.from_now } if cookies[:landing_url].blank?
      end
    end

    module RegistrationsController
      extend ActiveSupport::Concern

      included do
        alias_method :devise_build_resource, :build_resource
        def build_resource(hash = nil)
          custom_build_resource(hash)
        end
      end

      def custom_build_resource(hash = nil)
        devise_build_resource(hash)

        set_marketing_attributes if devise_mapping.acquirable?

        resource
      end

      def set_marketing_attributes
        resource.referring_url = cookies[:referring_url]
        resource.landing_url = cookies[:landing_url]
      end
    end

    class Engine < ::Rails::Engine
      ActiveSupport.on_load(:action_controller) do
        include Devise::Acquirable::Controller
      end

      config.to_prepare do
        Devise::RegistrationsController.include Devise::Acquirable::RegistrationsController
      end
    end
  end
end
