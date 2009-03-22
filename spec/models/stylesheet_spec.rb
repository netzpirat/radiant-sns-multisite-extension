require File.dirname(__FILE__) + '/../spec_helper'

describe Stylesheet do
  dataset :stylesheets
  
  before(:each) do
    Page.current_site = sites(:test)
    @stylesheet = stylesheets(:main)
  end

  it "should have a site" do
    Stylesheet.reflect_on_association(:site).should_not be_nil
    @stylesheet.respond_to?(:site).should be_true
    @stylesheet.site.should == sites(:test)
  end
  
  it "should get the current site automatically on validation" do
    a = Stylesheet.new
    a.valid?
    a.site.should == sites(:test)
  end
  
  it "should not be able to retrieve an asset belonging to another site" do
    lambda{ a = stylesheets(:other) }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "should be able to retrieve an asset belonging to the current site" do
    Page.current_site = sites(:elsewhere)
    lambda{ a = stylesheets(:other) }.should_not raise_error(ActiveRecord::RecordNotFound)
  end

end
