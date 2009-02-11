require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NumberingRulesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "numbering_rules", :action => "index").should == "/numbering_rules"
    end
  
    it "should map #new" do
      route_for(:controller => "numbering_rules", :action => "new").should == "/numbering_rules/new"
    end
  
    it "should map #show" do
      route_for(:controller => "numbering_rules", :action => "show", :id => 1).should == "/numbering_rules/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "numbering_rules", :action => "edit", :id => 1).should == "/numbering_rules/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "numbering_rules", :action => "update", :id => 1).should == "/numbering_rules/1"
    end
  
    it "should map #destroy" do
      route_for(:controller => "numbering_rules", :action => "destroy", :id => 1).should == "/numbering_rules/1"
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/numbering_rules").should == {:controller => "numbering_rules", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/numbering_rules/new").should == {:controller => "numbering_rules", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/numbering_rules").should == {:controller => "numbering_rules", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/numbering_rules/1").should == {:controller => "numbering_rules", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/numbering_rules/1/edit").should == {:controller => "numbering_rules", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/numbering_rules/1").should == {:controller => "numbering_rules", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/numbering_rules/1").should == {:controller => "numbering_rules", :action => "destroy", :id => "1"}
    end
  end
end
