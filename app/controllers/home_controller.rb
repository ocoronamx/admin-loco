class HomeController < ApplicationController
  def index
    @breadcrumb = {
      list: [
        { href: '/', text: 'Home', active: true }
      ]
    }
  end
  def test

    @breadcrumb = {
      list: [
        { href: '/', text: 'Home' },
        { href: '/home/test', text: 'Test', active: 'active' }
      ]
    }
  end
end
