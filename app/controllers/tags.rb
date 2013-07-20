#route to display all tags
get "/tags" do
  @tags = Tag.all
  erb :all_tags
end

#route to display posts under a given tag
get "/tags/posts/:id" do
  @current_tag = Tag.find(params[:id])
  erb :posts_with_tag
end
