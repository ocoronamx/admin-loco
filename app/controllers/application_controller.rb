class ApplicationController < ActionController::Base
  helper_method :active_link?
  def active_link?(controller, action)
    request.parameters['action'].eql?(action.to_s) && request.parameters['controller'].eql?(controller.to_s)
  end
end
