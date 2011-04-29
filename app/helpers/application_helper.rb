module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "AME"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def logo
    image_tag("logo.jpg", :size => "80x80", :alt => "AME", :class => "round")
  end

end
