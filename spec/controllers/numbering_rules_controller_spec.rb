require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NumberingRulesController do

  def mock_numbering_rule(stubs={})
    @mock_numbering_rule ||= mock_model(NumberingRule, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all numbering_rules as @numbering_rules" do
      NumberingRule.should_receive(:find).with(:all).and_return([mock_numbering_rule])
      get :index
      assigns[:numbering_rules].should == [mock_numbering_rule]
    end

    describe "with mime type of xml" do
  
      it "should render all numbering_rules as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        NumberingRule.should_receive(:find).with(:all).and_return(numbering_rules = mock("Array of NumberingRules"))
        numbering_rules.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested numbering_rule as @numbering_rule" do
      NumberingRule.should_receive(:find).with("37").and_return(mock_numbering_rule)
      get :show, :id => "37"
      assigns[:numbering_rule].should equal(mock_numbering_rule)
    end
    
    describe "with mime type of xml" do

      it "should render the requested numbering_rule as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        NumberingRule.should_receive(:find).with("37").and_return(mock_numbering_rule)
        mock_numbering_rule.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new numbering_rule as @numbering_rule" do
      NumberingRule.should_receive(:new).and_return(mock_numbering_rule)
      get :new
      assigns[:numbering_rule].should equal(mock_numbering_rule)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested numbering_rule as @numbering_rule" do
      NumberingRule.should_receive(:find).with("37").and_return(mock_numbering_rule)
      get :edit, :id => "37"
      assigns[:numbering_rule].should equal(mock_numbering_rule)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created numbering_rule as @numbering_rule" do
        NumberingRule.should_receive(:new).with({'these' => 'params'}).and_return(mock_numbering_rule(:save => true))
        post :create, :numbering_rule => {:these => 'params'}
        assigns(:numbering_rule).should equal(mock_numbering_rule)
      end

      it "should redirect to the created numbering_rule" do
        NumberingRule.stub!(:new).and_return(mock_numbering_rule(:save => true))
        post :create, :numbering_rule => {}
        response.should redirect_to(numbering_rule_url(mock_numbering_rule))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved numbering_rule as @numbering_rule" do
        NumberingRule.stub!(:new).with({'these' => 'params'}).and_return(mock_numbering_rule(:save => false))
        post :create, :numbering_rule => {:these => 'params'}
        assigns(:numbering_rule).should equal(mock_numbering_rule)
      end

      it "should re-render the 'new' template" do
        NumberingRule.stub!(:new).and_return(mock_numbering_rule(:save => false))
        post :create, :numbering_rule => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested numbering_rule" do
        NumberingRule.should_receive(:find).with("37").and_return(mock_numbering_rule)
        mock_numbering_rule.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :numbering_rule => {:these => 'params'}
      end

      it "should expose the requested numbering_rule as @numbering_rule" do
        NumberingRule.stub!(:find).and_return(mock_numbering_rule(:update_attributes => true))
        put :update, :id => "1"
        assigns(:numbering_rule).should equal(mock_numbering_rule)
      end

      it "should redirect to the numbering_rule" do
        NumberingRule.stub!(:find).and_return(mock_numbering_rule(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(numbering_rule_url(mock_numbering_rule))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested numbering_rule" do
        NumberingRule.should_receive(:find).with("37").and_return(mock_numbering_rule)
        mock_numbering_rule.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :numbering_rule => {:these => 'params'}
      end

      it "should expose the numbering_rule as @numbering_rule" do
        NumberingRule.stub!(:find).and_return(mock_numbering_rule(:update_attributes => false))
        put :update, :id => "1"
        assigns(:numbering_rule).should equal(mock_numbering_rule)
      end

      it "should re-render the 'edit' template" do
        NumberingRule.stub!(:find).and_return(mock_numbering_rule(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested numbering_rule" do
      NumberingRule.should_receive(:find).with("37").and_return(mock_numbering_rule)
      mock_numbering_rule.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the numbering_rules list" do
      NumberingRule.stub!(:find).and_return(mock_numbering_rule(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(numbering_rules_url)
    end

  end

end
