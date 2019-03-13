class TeachersController < Sinatra::Base

  set :views, 'app/views/teachers'
  set :method_override, true


  #read
  get '/teachers' do
    @teachers = Teacher.all
    erb :index
  end

  #create new
  get '/teachers/new' do
    erb :new
  end

  post '/teachers' do
    teachers = Teacher.find_or_create_by(name: params[:name])
    redirect "/teachers/#{teachers.id}"
  end

  #show teachers detail
  get '/teachers/:id' do
    @teacher = Teacher.find(params[:id])
    @students = @teacher.students
    erb :show
  end

  #update
  get '/teachers/:id/edit' do
    @teacher = Teacher.find(params[:id])
    erb :edit
  end

  put '/teachers/:id' do
    teacher = Teacher.find(params[:id])
    teacher.update(name: params[:name])

    redirect "/teachers/#{teacher.id}"
  end

  delete '/teachers/:id' do
    teacher = Teacher.find(params[:id])
    teacher.delete
    redirect '/teachers'
  end



end
