# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      admin_tests_url
    else
      stored_location_for(resource) || super
    end
  end
end
