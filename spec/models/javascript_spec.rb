require File.dirname(__FILE__) + '/../spec_helper'

describe Javascript do
  dataset :javascripts
  
  before(:each) do
    Page.current_site = sites(:test)
    @javascript = javascripts(:main)
  end

  it "should have a site" do
    Javascript.reflect_on_association(:site).should_not be_nil
    @javascript.respond_to?(:site).should be_true
    @javascript.site.should == sites(:test)
  end
  
  it "should get the current site automatically on validation" do
    a = Javascript.new
    a.valid?
    a.site.should == sites(:test)
  end
  
  it "should not be able to retrieve an asset belonging to another site" do
    lambda{ a = javascripts(:other) }.should raise_error(ActiveRecord::RecordNotFound)
  end

  it "should be able to retrieve an asset belonging to the current site" do
    Page.current_site = sites(:elsewhere)
    lambda{ a = javascripts(:other) }.should_not raise_error(ActiveRecord::RecordNotFound)
  end

end
