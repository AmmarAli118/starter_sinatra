class ApplicationController < Sinatra::Base

 set :views, 'app/views'

  #index
  get '/' do
    erb :home
  end

end
