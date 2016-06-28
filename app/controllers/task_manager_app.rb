class TaskManagerApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = task_manager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    task_manager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id|
    @task = task_manager.find(id.to_i)
    erb :show
  end

  def task_manager
    @database ||= YAML::Store.new("db/task_manager")
    TaskManager.new(@database)
  end


  not_found do
    erb :error
  end
end
