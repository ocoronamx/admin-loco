class HomeController < ApplicationController
  def index
    init_breadcrumb 'Starter Page'
    init_todo

    add_todo 0, 'Implementar Vue.js'
    add_todo 0, 'Vista notices'

    add_pending 0, 'Vista show'
    add_pending 0, 'Implementar colorize'

    set_done
  end
  def set_done
    add_done 'Mejorar Home'
    add_done  'Vista demo landing'
    add_done  'Vista demo login'
    add_done  'Vista demo index'
    add_done  'Vista demo form'
    add_done  'Migrar demos a su propio controlador'
    add_done  'Implementar template adminlte'
  end
  def init_todo
    @todos = { todo: [], pending: [], done: [] }
  end
  def add_todo(progress, task)
    @todos[:todo] << { task: task, progress: progress }
  end
  def add_pending(progress, task)
    @todos[:pending] << { task: task, progress: progress }
  end
  def add_done(task)
    @todos[:done] << { task: task, progress: 100 }
  end
end
