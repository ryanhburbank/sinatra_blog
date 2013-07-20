#route to display all posts in a list
get "/posts" do 
  if session[:id]
    @user = User.find(session[:id])
    @posts = @user.posts
    erb :all_posts
  else
    redirect to ("/")
  end
end

#route to display a single post
get "/posts/post/:id" do
  @current_post = Post.find(params[:id])
  erb :single_post
end  

#route to display form to create a new post
get "/posts/new" do
  @current_user = session[:id]
  erb :new_post
end

#route to display form to edit an existing post
get "/posts/edit/:id" do
  @post = Post.find(params[:id])
  p @post.id
  erb :edit_post
end

#route to request to create a new post
post "/posts/new" do
  @post = current_user.posts.build(params[:post])
  @post.save
  redirect to ("/posts/post/#{@post.id}")
end

# route to request to update a post
post "/posts/update/:id" do
  Post.update(params[:id], params[:post])
  Post.delete_tags_with_no_posts   

  redirect to ("/posts/post/#{params[:id]}")
end

#route to request to delte a post
get "/posts/delete/:id" do
  @post = Post.find(params[:id])
  @post.destroy
  Post.delete_tags_with_no_posts
  redirect to ("/posts")
end
