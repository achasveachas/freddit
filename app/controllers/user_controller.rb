class UsersController < ApplicationController

# Displayse the "Sign Up" form and creates a new user
  get '/signup' do
    redirect '/conversations' if logged_in?
    erb :'users/new.html'
  end

  post '/signup' do

    user = User.create(params)
    session[:id] = user.id

    if user.save
      redirect '/conversations'
    else
      redirect '/signup'
    end
  end

# Displayse the "Log In" form and logs in user
  get '/login' do
    redirect '/conversations' if logged_in?
    erb :'users/login.html'
  end

  post '/login' do
    redirect '/login' if params[:username] == "" || params[:password] == ""
    login(params[:username], params[:password])
    redirect '/conversations'
  end

# Logs out user
  get '/logout' do
    logout!
    redirect '/login'
  end

  #Show Item Controller
  get "/users/:slug" do
    erb :"/users/show.html"
  end

  #Edit Item Controller
  get "/users/:slug/edit" do
    erb :"/users/edit.html"
  end

  patch "/users" do
    "Edits an individual item"

    #redirect "/users/:slug" TODO: update ":slug" with the item"s :ID and uncomment
  end

  #Delete Item Controller
  delete "/users/:slug/delete" do
    "Deletes an individual item"

    redirect "/users"
  end
end
