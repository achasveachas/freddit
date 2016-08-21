require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, 'freddit'
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def logged_in?
      !!session[:id]
    end

    def current_user
      @current_user ||= User.find(session[:id]) if session[:id]
    end

    def login(username, password)
      user = User.find_by(:username => username)
      if user && user.authenticate(password)
        session[:id] = user.id
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end
  end

end
