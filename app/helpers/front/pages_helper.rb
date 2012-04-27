module Front::PagesHelper
  
  def get_generated_menu()
    
    p '44444'
    p '44444'
    p '44444'
    p '44444'
    p @page
    
    children_output = "<ul id='menu'>"
    children_of_root = @current_site.pages.root.minimal_attributes.first.children_with_minimal_attributes.to_a
    
    #children_of_root.delete_if { |p| !include_page?(p) }
    
    children_of_root.each_with_index do |p, index|
      css = []
      css << 'first' if index == 0
      css << 'last' if index == children_of_root.size - 1
      
      if p.slug == "spectacles" || p.slug == "spectacle" || p.slug == "newsletter"
        is_page = false
      else
        is_page = true  
      end

      children_output += render_entry_link(p, css.join(' '), is_page, 1)
    end
    
    children_output += "</ul>"
    children_output 
    
  end
  
  
  # Returns a list element, a link to the page and its children
  def render_entry_link(page, css, is_page, depth)
    
    selected = @page.fullpath =~ /^#{page.fullpath}/ ? ' on' : ''
    
    css << 'fat' if page.fat
    
    output  = %{<li id="#{page.slug.dasherize}-link" class="link #{selected} #{css}">}
    if is_page
      output << %{<a href="/#/pages/#{page.fullpath}">#{page.title}</a>}
    else
      output << %{<a href="/#/#{page.fullpath}">#{page.title}</a>}
    end
    output << render_entry_children(page, is_page, depth.succ)
    output << %{</li>}

    output.strip
  end

  # Recursively creates a nested unordered list for the depth specified
  def render_entry_children(page, is_page, depth)
    output = %{}    

    children = page.children_with_minimal_attributes.reject { |c| !include_page?(c) }
    if children.present?
      output = %{<ul id="#{page.slug.dasherize}" class="sub_menu #{'fat_menu' if page.fat != false}">}
      children.each do |c, page|
        css = []
        css << 'first' if children.first == c
        css << 'last'  if children.last  == c

        output << render_entry_link(c, css.join(' '), is_page, depth)
      end
      output << %{</ul>}
    end

    output
  end
  
  def include_page?(page)
    if !page.listed? || page.templatized? || !page.published?
      false
    #elsif @options[:exclude]
    #  (page.fullpath =~ @options[:exclude]).nil?
    else
      true
    end
  end
  
end