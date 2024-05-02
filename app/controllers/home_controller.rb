class HomeController < ApplicationController
  def index
    @breadcrumb = { title: 'Starter Page',
      list: [
        { href: root_path, text: I18n.t(:'home.title') }
      ]
    }
  end
end
