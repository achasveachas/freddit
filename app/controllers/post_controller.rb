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
  get "/posts/:id/edit" do
    @post = Post.find_by(id: params[:id])
    if can_edit?(@post)
      erb :"/posts/edit.html"
    else
      flash[:message] = "Whoops! You do not have permission to edit this page."
      redirect "/conversations/#{@post.conversation.id}"
    end
  end

  patch "/posts/:id" do
    @post = Post.find_by(id: params[:id])
    if can_edit?(@post)
      @post.update(params[:post])
      redirect "/conversations/#{@post.conversation.id}"
    else
      flash[:message] = "Whoops! You do not have permission to edit this page."
      redirect "/conversations/#{@post.conversation.id}"
    end
  end

  #Delete Item Controller
  get "/posts/:id/delete" do
    @post = Post.find_by(id: params[:id])
    if can_edit?(@post)
      @post.destroy
      redirect "/conversations/#{@post.conversation.id}"
    else
      flash[:message] = "Whoops! You do not have permission to edit this page."
      redirect "/conversations/#{@post.conversation.id}"
    end
  end
end
