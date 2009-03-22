class TextAssetSitesDataset < Dataset::Base

  def load
    create_record Site, :test, :name => 'Test Site', :domain => 'test', :base_domain => 'test.host', :position => 1
    create_record Site, :elsewhere, :name => 'Another Site', :domain => 'other', :base_domain => 'other.host', :position => 2
    Page.current_site = sites(:test)
  end
 
end