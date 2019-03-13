class StudentsController < Sinatra::Base

  set :views, 'app/views/students'
  set :method_override, true


  #read
  get '/students' do
    @students = Student.all
    erb :index
  end

  #create new
  get '/students/new' do
    @teachers = Teacher.all
    erb :new
  end

  post '/students' do
    students = Student.find_or_create_by(name: params[:name])
    students.teacher_id = params[:teacher]
    redirect "/students/#{students.id}"
  end

  #show students detail
  get '/students/:id' do
    @student = Student.find(params[:id])
    @teacher = @student.teacher
    # binding.pry
    erb :show
  end

  #update
  get '/students/:id/edit' do
    @student = Student.find(params[:id])
    @teachers = Teacher.all
    erb :edit
  end

  put '/students/:id' do
    student = Student.find(params[:id])
    student.update(teacher_id: params[:teacher])

    redirect "/students/#{student.id}"
  end

  #delete
  delete '/students/:id' do
    student = Student.find(params[:id])
    student.delete
    redirect '/students'
  end
end
