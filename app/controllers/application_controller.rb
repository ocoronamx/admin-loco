class ApplicationController < ActionController::Base
  helper_method :active_link?
  def active_link?(controller, action)
    request.parameters['action'].eql?(action.to_s) && request.parameters['controller'].eql?(controller.to_s)
  end
  def init_breadcrumb(title)
    @breadcrumb = { title: title, list: [] }
    @breadcrumb[:list] << { href: home_path, text: I18n.t(:'home.title') }
  end
  def add_breadcrumb(path, i18n)
    @breadcrumb[:list] << { href: path, text: I18n.t(:"#{i18n}") }
  end
end
