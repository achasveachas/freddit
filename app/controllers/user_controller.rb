class UsersController < ApplicationController

# Displayse the "Sign Up" form and creates a new user
  get '/signup' do
    redirect '/' if logged_in?
    erb :'users/new.html'
  end

  post '/signup' do

    user = User.create(params[:user])
    session[:id] = user.id
    user.save

    if user.save
      redirect '/'
    else
      flash[:message] = "Please enter a valid username, email address, and password."
      redirect '/signup'
    end
  end

# Displayse the "Log In" form and logs in user
  get '/login' do
    redirect '/' if logged_in?
    erb :'users/login.html'
  end

  post '/login' do
    redirect '/login' if params[:username] == "" || params[:password] == ""
    login(params[:username], params[:password])
    redirect '/'
  end

# Logs out user
  get '/logout' do
    logout!
    redirect '/'
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
