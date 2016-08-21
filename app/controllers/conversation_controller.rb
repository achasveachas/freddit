class ConversationsController < ApplicationController

  #Index Controller
  get "/conversations" do
    erb :"/conversations/index"
  end

  #New Item Controllers
  get "/conversations/new" do
    erb :"/conversations/new"
  end

  post "/conversations" do
    "Create a new item"

    redirect "/conversations"
  end

  #Show Item Controller
  get "/conversations/:slug" do
    erb :"/conversations/show"
  end

  #Edit Item Controller
  get "/conversations/:slug/edit" do
    erb :"/conversations/edit"
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
