class SnsMultisiteExtension < Radiant::Extension
  version "0.1"
  description "Scopes javascripts and stylesheets to sites. It requires the spanner fork of multi_site"
  url ""
  
  def activate
    TextAsset.send :is_site_scoped
    admin.text_asset.index.add :top, "admin/shared/site_jumper"
  end
  
end