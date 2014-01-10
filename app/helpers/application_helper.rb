module ApplicationHelper
 # Generates sorting ling for table column.
 def sortable(column, title = nil)
    # If title is missing, then the title is generated from the column name.
    title ||= column.to_s.titleize
    # If sort direction in parameter is set to asc, then change it to desc.
    direction = params[:direction] == "asc" ? "desc" : "asc"
    # Generate the link.
    link_to title, sort: column, direction: direction
 end

 # Verify if user is loged in.
 def logged_in?
   not request.authorization.nil?
 end

 # Show active menu item.
 def nav_link(text, link)
    recognized = Rails.application.routes.recognize_path(link)
    if recognized[:controller] == params[:controller] && recognized[:action] == params[:action]
        content_tag(:li, :class => "active") do
            link_to( text, link)
        end
    else
        content_tag(:li) do
            link_to( text, link)
        end
    end
end
end
