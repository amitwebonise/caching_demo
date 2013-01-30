class PostSweeper < ActionController::Caching::Sweeper
  observe Post,Comment # This sweeper is going to keep an eye on the Post Model

  # If our sweeper detects that a Product was created call this
  def after_create(post)
    expire_cache_for(post)
  end

  # If our sweeper detects that a Product was updated call this
  def after_update(post)
    expire_cache_for(post)
  end

  # If our sweeper detects that a Product was deleted call this
  def after_destroy(post)
    expire_cache_for(post)
  end

  private
  def expire_cache_for(post)
    expire_page(:controller => :posts, :action => :index)
    expire_fragment("post_counts")
    expire_action(:controller => :posts, :action => :show, :id => post.instance_of?(Post) ? post.id : post.post.id)
  end
end