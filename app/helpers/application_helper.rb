module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "AME"
    if @title.nil?
      base_title
    else
      "#{base_title} abc | #{@title}"
    end
  end
  
end
