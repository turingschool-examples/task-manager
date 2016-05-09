class TaskManagerApp < Sinatra::Base


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

  get '/' do
    erb :dashboard
  end

  get '/tasks/:id' do |id|
    @task = task_manager.find(id.to_i)
    erb :show
  end

  get '/tasks/:id/edit' do |id|
    @task = task_manager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    task_manager.update(id.to_i, params[:task])
    redirect "tasks/#{id}"
  end

  delete '/tasks/:id' do |id|
    task_manager.delete(id.to_i)
    redirect '/tasks'
  end

  def task_manager
    TaskManager.new
  end

  not_found do
    erb :error
  end
end
