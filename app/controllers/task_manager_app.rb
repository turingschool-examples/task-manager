require 'models/task_manager'

class TaskManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = ["task1", "task2", "task3" ]
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end
end
