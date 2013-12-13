module ApplicationHelper
  
  def title(txt)
    content_for(:title) { txt }
  end
end
