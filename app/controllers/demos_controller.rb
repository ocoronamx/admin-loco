class DemosController < ApplicationController
  layout "outside", only: [:login, :landing]
  def index
    @breadcrumb = { title: 'Index demo',
      list: [
        { href: home_path, text: I18n.t(:'home.title') },
        { href: demo_index_path, text: I18n.t(:'demo.index') }
      ]
    }
    @list = [
      { id: '000', name: 'Alexander Pierce', email: 'root@mail.com', role: 'admin' },
      { id: '001', name: 'Lucy Jhonson', email: 'lucyjhonson@mail.com', role: 'admin' },
      { id: '002', name: 'Jhon Anderson', email: 'jhonanderson@mail.com', role: 'employee' },
      { id: '003', name: 'Sophie Turner', email: 'sophieturner@mail.com', role: 'technical' },
    ]
  end

  def form
    @breadcrumb = { title: 'Form demo',
      list: [
        { href: home_path, text: I18n.t(:'home.title') },
        { href: demo_form_path, text: I18n.t(:'demo.form') }
      ]
    }
  end

  def show
  end

  def notices
  end

  def landing
  end

  def login
  end
end
