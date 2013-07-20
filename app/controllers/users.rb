#route to display homepage showing login and new user creation 

get "/" do
  @posts = Post.all
  erb :landing_page
end

#route to request to create a new user
post "/user/new" do
  @user = User.new(:name => params[:user][:name],
                   :email => params[:user][:email],
                   :password => params[:user][:password])
  @user.save
  if @user.id
    redirect ("/user/login"), 307
  else
    flash[:error] = "Create attempt failed, please try again...you Son of a BITCH."
    redirect ("/")
  end
end

#route to request to login a new user
post "/user/login" do
  @user = User.authenticate(params[:user][:email],
                            params[:user][:password])
  if @user
    session[:id] = @user.id
    flash[:welcome] = "Welcome #{@user.name}!"
    redirect to ("/posts")
  else
    flash[:error] = "Credentials not valid. Try again."
    redirect to("/")
  end
end

#route to request to logout a user
get "/user/logout" do
  session[:id] = nil 
  redirect ("/")
end
