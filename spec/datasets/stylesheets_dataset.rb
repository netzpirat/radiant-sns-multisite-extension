class StylesheetsDataset < Dataset::Base
  uses :text_asset_sites if defined? Site

  def load
    create_stylesheet "Main"
    create_stylesheet "Other", :site_id => site_id(:elsewhere)
  end
  
  helpers do
    def create_stylesheet(name, attributes={})
      asset = create_record Stylesheet, name.symbolize, stylesheet_attributes(attributes.update(:name => name))
    end
    
    def stylesheet_attributes(attributes={})
      name = attributes[:name] || unique_javascript_name
      {
        :name => name,
        :content => "stylesheet content for #{name}"
      }.merge(attributes)
    end

    private

      @@unique_stylesheet_name_call_count = 0

      def unique_stylesheet_name
        @@unique_stylesheet_name_call_count += 1
        "stylesheet-#{@@unique_stylesheet_name_call_count}.css"
      end

  end
end
