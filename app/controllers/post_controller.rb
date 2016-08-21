class PostsController < ApplicationController

  #Index Controller
  get "/posts" do
    erb :"/posts/index"
  end

  #New Item Controllers
  get "/posts/new" do
    erb :"/posts/new"
  end

  post "/posts" do
    "Create a new item"

    redirect "/posts"
  end

  #Show Item Controller
  get "/posts/:slug" do
    erb :"/posts/show"
  end

  #Edit Item Controller
  get "/posts/:slug/edit" do
    erb :"/posts/edit"
  end

  patch "/posts" do
    "Edits an individual item"

    #redirect "/posts/:slug" TODO: update ":slug" with the item"s :ID and uncomment
  end

  #Delete Item Controller
  delete "/posts/:slug/delete" do
    "Deletes an individual item"

    redirect "/posts"
  end
end
