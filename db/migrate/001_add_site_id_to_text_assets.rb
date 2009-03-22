class AddSiteIdToTextAssets < ActiveRecord::Migration
  def self.up
    add_column :text_assets, :site_id, :integer
  end
  
  def self.down
    remove_column :text_assets, :site_id
  end
end