class Post < ActiveRecord::Base
  has_many :posts_tags
  has_many :tags, :through => :posts_tags
  belongs_to :user
  validates :body, :title, :presence => true
  #add validations

  def tags=(tag_names)
    self.tags.clear
    tags = tag_names.split(',')
    tags.each do |t|
      tag = Tag.find_or_create_by_tag_name(tag_name: t)
      self.tags << tag
    end
  end

  def return_tags
    @tags = self.tags
    tag_string = ''
    @tags.each do |tag|
      tag_string += tag.tag_name + ","
    end
    tag_string.chop!
    return tag_string
  end

  def self.delete_tags_with_no_posts
    all_tags = Tag.all 

    all_tags.each do |tag|
      tag.destroy if tag.posts.empty?
    end

  end
end
