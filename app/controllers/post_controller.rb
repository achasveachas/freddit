class PostsController < ApplicationController


  #New Item Controllers

  post "/conversations/:id/posts" do
    if logged_in?
      convo = Conversation.find_by(id: params[:id])
      post = convo.posts.create(params[:post])
      post.user = current_user
      post.save
    else
      flash[:message] = "Whoops! Please log in to join the conversation."
    end
    redirect "/conversations/#{convo.id}"
  end

  #Edit Item Controller
  get "/posts/:slug/edit" do
    erb :"/posts/edit.html"
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
