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
    if logged_in?
      @convo = Conversation.create(params[:conversation])
      @convo.user = current_user
      @post = @convo.posts.create(params[:post])
      @post.user = current_user
      @convo.save
      @post.save
      redirect "/conversations"
    else
      flash[:message] = "You need to be signed in to start a conversation."
      redirect '/login'
    end
  end

  #Show Item Controller
  get "/conversations/:slug" do
    erb :"/conversations/show.html"
  end

  #Edit Item Controller
  get "/conversations/:slug/edit" do
    erb :"/conversations/edit.html"
  end

  patch "/conversations" do
    "Edits an individual item"

    #redirect "/conversations/:slug" TODO: update ":slug" with the item"s :ID and uncomment
  end

  #Delete Item Controller
  delete "/conversations/:slug/delete" do
    "Deletes an individual item"

    redirect "/conversations"
  end
end
end
