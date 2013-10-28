module Admin
  class RenderingController < ActionController::Base

    include Locomotive::Routing::SiteDispatcher

    include Locomotive::Render

    before_filter :require_site
    before_filter :authenticate_admin!, :only => [:edit]
    before_filter :validate_site_membership, :only => [:edit]

    def show
      render_locomotive_page
    end
    
    def search  
      query = params[:search_query][:query]
      results = []
      
      if query != "" and query != nil
        query.downcase!
        spectacles_result = []

        #récupération des types de contenu searchable
        searchables = ContentType.where(:searchable => true)
        
        #construction des objects
        searchables.each do |ser_con|
          
          #creation du pattern de recherche avec les custom fields n
          search_pattern = ser_con.content_custom_fields.map do |fld|
            {"#{fld._name}" => /#{query}/i} 
          end
        
          # on lance la requette sur le type courant
          ser_con.contents.where('$or' => search_pattern).each do |p|
            so = SearchObject.new()
            so.type = ser_con.slug
            so.title = p.highlighted_field_value
            so.permalink = p._permalink
            if ser_con.slug == 'produits'
              so.image = p.images.first.pic.url
            end
            results << so
          end
        end
        
        #on cherche dans les pages
        # pages = Page.where('$or' => [{:titre => /#{query}/i}, {:body => /#{query}/i}]).map do |pgs|
        #   pg = SearchObject.new()
        #   pg.type = "pages"
        #   pg.title = pgs.title
        #   pg.permalink = pgs._permalink
        #   results << pg
        # end
        # editable = Page.all.each do |p|
        #   p.editable_elements.where('$or' => [{:content => /#{query}/i}]).map do |edtb|
        #     ed = SearchObject.new()
        #     ed.type = "pages"
        #     ed.title = edtb.title
        #     ed.permalink = edtb._permalink
        #     results << ed
        #   end
        # end

      
      end
      @search_result = results
      @query_string = query
      
      render_locomotive_page
    end

    def edit
      @editing = true
      render_locomotive_page
    end

  end
end
