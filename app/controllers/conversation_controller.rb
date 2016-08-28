class ConversationsController < ApplicationController

  #Index Controller
  get "/conversations" do
    erb :"/conversations/index.html"
  end

  #New Item Controllers
  get "/conversations/new" do
    if logged_in? && !current_user.banned
      erb :"/conversations/new.html"
    else
      flash[:message] = "You need to be signed in to start a conversation."
      redirect '/login'
    end
  end

  post "/conversations" do
    if params[:conversation][:topic] == "" || params[:post][:content] == ""
      flash[:message] = "A conversation needs a topic and a first post."
      redirect '/conversations/new'
    end
    if logged_in? && !current_user.banned
      @convo = Conversation.create(params[:conversation])
      @convo.user = current_user
      @convo.save
      @post = @convo.posts.create(params[:post])
      @post.user = current_user
      @post.save
      redirect "/conversations/#{@convo.id}"
    else
      flash[:message] = "You need to be signed in to start a conversation."
      redirect '/login'
    end
  end

  #Show Item Controller
  get "/conversations/:id" do
    @convo = Conversation.find_by(id: params[:id])
    erb :"/conversations/show.html"
  end

  #Edit Item Controller
  get "/conversations/:id/edit" do
    @convo = Conversation.find_by(id: params[:id])
    if logged_in? && (@convo.user == current_user || current_user.moderator) && !current_user.banned
      erb :"/conversations/edit.html"
    else
      flash[:message] = "Whoops! You do not have permission to edit this page."
      redirect "/conversations/#{@convo.id}"
    end
  end

  patch "/conversations/:id" do
    @convo = Conversation.find_by(id: params[:id])
    if logged_in? && (@convo.user == current_user || current_user.moderator) && !current_user.banned
      @convo.update(params[:conversation])
      redirect "/conversations/#{@convo.id}"
    else
      flash[:message] = "Whoops! You do not have permission to edit this page."
      redirect "/conversations/#{@convo.id}"
    end
  end

  #Delete Item Controller
  delete "/conversations/:id/delete" do
    @convo = Conversation.find_by(id: params[:id])
    if logged_in? && (@convo.user == current_user || current_user.moderator) && !current_user.banned
      @convo.posts.delete_all
      @convo.destroy
      redirect "/conversations"
    else
      flash[:message] = "Whoops! You do not have permission to edit this page."
      redirect "/conversations/#{@convo.id}"
    end
  end
end
