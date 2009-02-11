require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe NumberingResetTypesController do

  def mock_numbering_reset_type(stubs={})
    @mock_numbering_reset_type ||= mock_model(NumberingResetType, stubs)
  end
  
  describe "responding to GET index" do

    it "should expose all numbering_reset_types as @numbering_reset_types" do
      NumberingResetType.should_receive(:find).with(:all).and_return([mock_numbering_reset_type])
      get :index
      assigns[:numbering_reset_types].should == [mock_numbering_reset_type]
    end

    describe "with mime type of xml" do
  
      it "should render all numbering_reset_types as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        NumberingResetType.should_receive(:find).with(:all).and_return(numbering_reset_types = mock("Array of NumberingResetTypes"))
        numbering_reset_types.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested numbering_reset_type as @numbering_reset_type" do
      NumberingResetType.should_receive(:find).with("37").and_return(mock_numbering_reset_type)
      get :show, :id => "37"
      assigns[:numbering_reset_type].should equal(mock_numbering_reset_type)
    end
    
    describe "with mime type of xml" do

      it "should render the requested numbering_reset_type as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        NumberingResetType.should_receive(:find).with("37").and_return(mock_numbering_reset_type)
        mock_numbering_reset_type.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new numbering_reset_type as @numbering_reset_type" do
      NumberingResetType.should_receive(:new).and_return(mock_numbering_reset_type)
      get :new
      assigns[:numbering_reset_type].should equal(mock_numbering_reset_type)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested numbering_reset_type as @numbering_reset_type" do
      NumberingResetType.should_receive(:find).with("37").and_return(mock_numbering_reset_type)
      get :edit, :id => "37"
      assigns[:numbering_reset_type].should equal(mock_numbering_reset_type)
    end

  end

  describe "responding to POST create" do

    describe "with valid params" do
      
      it "should expose a newly created numbering_reset_type as @numbering_reset_type" do
        NumberingResetType.should_receive(:new).with({'these' => 'params'}).and_return(mock_numbering_reset_type(:save => true))
        post :create, :numbering_reset_type => {:these => 'params'}
        assigns(:numbering_reset_type).should equal(mock_numbering_reset_type)
      end

      it "should redirect to the created numbering_reset_type" do
        NumberingResetType.stub!(:new).and_return(mock_numbering_reset_type(:save => true))
        post :create, :numbering_reset_type => {}
        response.should redirect_to(numbering_reset_type_url(mock_numbering_reset_type))
      end
      
    end
    
    describe "with invalid params" do

      it "should expose a newly created but unsaved numbering_reset_type as @numbering_reset_type" do
        NumberingResetType.stub!(:new).with({'these' => 'params'}).and_return(mock_numbering_reset_type(:save => false))
        post :create, :numbering_reset_type => {:these => 'params'}
        assigns(:numbering_reset_type).should equal(mock_numbering_reset_type)
      end

      it "should re-render the 'new' template" do
        NumberingResetType.stub!(:new).and_return(mock_numbering_reset_type(:save => false))
        post :create, :numbering_reset_type => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT udpate" do

    describe "with valid params" do

      it "should update the requested numbering_reset_type" do
        NumberingResetType.should_receive(:find).with("37").and_return(mock_numbering_reset_type)
        mock_numbering_reset_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :numbering_reset_type => {:these => 'params'}
      end

      it "should expose the requested numbering_reset_type as @numbering_reset_type" do
        NumberingResetType.stub!(:find).and_return(mock_numbering_reset_type(:update_attributes => true))
        put :update, :id => "1"
        assigns(:numbering_reset_type).should equal(mock_numbering_reset_type)
      end

      it "should redirect to the numbering_reset_type" do
        NumberingResetType.stub!(:find).and_return(mock_numbering_reset_type(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(numbering_reset_type_url(mock_numbering_reset_type))
      end

    end
    
    describe "with invalid params" do

      it "should update the requested numbering_reset_type" do
        NumberingResetType.should_receive(:find).with("37").and_return(mock_numbering_reset_type)
        mock_numbering_reset_type.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :numbering_reset_type => {:these => 'params'}
      end

      it "should expose the numbering_reset_type as @numbering_reset_type" do
        NumberingResetType.stub!(:find).and_return(mock_numbering_reset_type(:update_attributes => false))
        put :update, :id => "1"
        assigns(:numbering_reset_type).should equal(mock_numbering_reset_type)
      end

      it "should re-render the 'edit' template" do
        NumberingResetType.stub!(:find).and_return(mock_numbering_reset_type(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested numbering_reset_type" do
      NumberingResetType.should_receive(:find).with("37").and_return(mock_numbering_reset_type)
      mock_numbering_reset_type.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "should redirect to the numbering_reset_types list" do
      NumberingResetType.stub!(:find).and_return(mock_numbering_reset_type(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(numbering_reset_types_url)
    end

  end

end
