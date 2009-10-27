class SnsMultisiteExtension < Radiant::Extension
  version "0.1"
  description "Scopes javascripts and stylesheets to sites. It requires the spanner fork of multi_site"
  url "http//github.com/netzpirat/radiant-sns-multisite-extension"
  
  extension_config do |config|
    config.extension 'sns'
    config.extension 'multi_site'
    config.extension 'submenu'
  end
  
  def activate
    TextAsset.send :is_site_scoped
    admin.tabs.remove "CSS"
    admin.tabs.remove "JS"
    admin.tabs['Pages'].add_link('stylesheets', '/admin/css', :visibility => [:admin, :developer])
    admin.tabs['Pages'].add_link('javascripts', '/admin/js', :visibility => [:admin, :developer])
  end
  
end