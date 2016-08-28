class ConversationsController < ApplicationController

  #Index Controller
  get "/conversations" do
    erb :"/conversations/index.html"
  end

  #New Item Controllers
  get "/conversations/new" do
    if logged_in?
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
    if logged_in?
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
    erb :"/conversations/edit.html"
  end

  patch "/conversations" do
    "Edits an individual item"

    #redirect "/conversations/:id" TODO: update ":id" with the item"s :ID and uncomment
  end

  #Delete Item Controller
  delete "/conversations/:id/delete" do
    "Deletes an individual item"

    redirect "/conversations"
  end
end
