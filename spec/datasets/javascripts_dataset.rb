class JavascriptsDataset < Dataset::Base
  uses :text_asset_sites if defined? Site

  def load
    create_javascript "Main"
    create_javascript "Other", :site_id => site_id(:elsewhere)
  end
  
  helpers do
    def create_javascript(name, attributes={})
      asset = create_record Javascript, name.symbolize, javascript_attributes(attributes.update(:name => name))
    end
    
    def javascript_attributes(attributes={})
      name = attributes[:name] || unique_javascript_name
      {
        :name => name,
        :content => "javascript content for #{name}"
      }.merge(attributes)
    end

  private

    @@unique_javascript_name_call_count = 0

    def unique_javascript_name
      @@unique_javascript_name_call_count += 1
      "javascript-#{@@unique_javascript_name_call_count}.js"
    end

  end
end
