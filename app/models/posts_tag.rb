class PostsTag < ActiveRecord::Base
  belongs_to :post
  belongs_to :tag
  #add validations
end
