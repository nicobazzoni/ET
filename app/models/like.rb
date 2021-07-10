class Like < ApplicationRecord
  belongs_to :post, counter_cache: true 
  belongs_to :user

  def post_name
    self.post ? post.name : ""
  end

  def post_name=(p_name)
    self.post = Post.find_or_create_by(name: p_name)
  end
end
