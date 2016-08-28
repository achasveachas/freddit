class UsersController < ApplicationController

# Displayse the "Sign Up" form and creates a new user
  get '/signup' do
    redirect '/' if logged_in?
    erb :'users/new.html'
  end

  post '/signup' do

    user = User.create(params[:user])
    user.image_url = "http://i0.wp.com/www.artifacting.com/blog/wp-content/uploads/2010/11/Kitten.jpg" if params[:user][:image_url] == ""
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
    if params[:username] == "" || params[:password] == ""
      flash[:message] = "Please enter a valid username, and password."
      redirect '/login'
    else
      login(params[:username], params[:password])
      redirect '/'
    end
  end

# Logs out user
  get '/logout' do
    logout!
    redirect '/'
  end

  get '/users' do
    erb :"/users/index.html"
  end

  #Show Item Controller
  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    erb :"/users/show.html"
  end

  #Edit Item Controller
  get "/users/:slug/edit" do
    @user = User.find_by_slug(params[:slug])
    if @user == current_user || current_user.moderator
      erb :"/users/edit.html"
    else
      flash[:message] = "Whoops! You do not have permission to edit this page."
      redirect "/users/#{@user.slug}"
    end
  end

  patch "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    if @user == current_user || current_user.moderator
      @user.update(params[:user])
      @user.image_url = "http://i0.wp.com/www.artifacting.com/blog/wp-content/uploads/2010/11/Kitten.jpg" if params[:user][:image_url] == ""
      @user.save
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = "Whoops! You do not have permission to edit this page."
      redirect "/users/#{@user.slug}"
    end
  end

  #Delete Item Controller
  delete "/users/:slug/delete" do
    @user = User.find_by_slug(params[:slug])
    if @user == current_user || current_user.moderator
      @user.destroy
      logout!
    else
      flash[:message] = "Whoops! You do not have permission for this action."
    end
    redirect "/users"
  end

  #Ban actions
  post "/users/:slug/ban" do
    if current_user.moderator
      user = User.find_by_slug(params[:slug])
      user.banned = true
      user.save
    end

    redirect "users/#{user.slug}"
  end

  post "/users/:slug/unban" do
    if current_user.moderator
      user = User.find_by_slug(params[:slug])
      user.banned = false
      user.save
    end

    redirect "users/#{user.slug}"
  end

  #Moderator actions
  post "/users/:slug/revoke_moderator" do
    if current_user.admin
      user = User.find_by_slug(params[:slug])
      user.moderator = false
      user.save
    end

    redirect "users/#{user.slug}"
  end

  post "/users/:slug/moderator" do
    if current_user.admin
      user = User.find_by_slug(params[:slug])
      user.moderator = true
      user.save
    end

    redirect "users/#{user.slug}"
  end
end
