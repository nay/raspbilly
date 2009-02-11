class NumberingResetTypesController < ApplicationController
  # GET /numbering_reset_types
  # GET /numbering_reset_types.xml
  def index
    @numbering_reset_types = NumberingResetType.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @numbering_reset_types }
    end
  end

  # GET /numbering_reset_types/1
  # GET /numbering_reset_types/1.xml
  def show
    @numbering_reset_type = NumberingResetType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @numbering_reset_type }
    end
  end

  # GET /numbering_reset_types/new
  # GET /numbering_reset_types/new.xml
  def new
    @numbering_reset_type = NumberingResetType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @numbering_reset_type }
    end
  end

  # GET /numbering_reset_types/1/edit
  def edit
    @numbering_reset_type = NumberingResetType.find(params[:id])
  end

  # POST /numbering_reset_types
  # POST /numbering_reset_types.xml
  def create
    @numbering_reset_type = NumberingResetType.new(params[:numbering_reset_type])

    respond_to do |format|
      if @numbering_reset_type.save
        flash[:notice] = 'NumberingResetType was successfully created.'
        format.html { redirect_to(@numbering_reset_type) }
        format.xml  { render :xml => @numbering_reset_type, :status => :created, :location => @numbering_reset_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @numbering_reset_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /numbering_reset_types/1
  # PUT /numbering_reset_types/1.xml
  def update
    @numbering_reset_type = NumberingResetType.find(params[:id])

    respond_to do |format|
      if @numbering_reset_type.update_attributes(params[:numbering_reset_type])
        flash[:notice] = 'NumberingResetType was successfully updated.'
        format.html { redirect_to(@numbering_reset_type) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @numbering_reset_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /numbering_reset_types/1
  # DELETE /numbering_reset_types/1.xml
  def destroy
    @numbering_reset_type = NumberingResetType.find(params[:id])
    @numbering_reset_type.destroy

    respond_to do |format|
      format.html { redirect_to(numbering_reset_types_url) }
      format.xml  { head :ok }
    end
  end
end
