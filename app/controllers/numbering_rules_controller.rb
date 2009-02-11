class NumberingRulesController < ApplicationController
  # GET /numbering_rules
  # GET /numbering_rules.xml
  def index
    @numbering_rules = NumberingRule.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @numbering_rules }
    end
  end

  # GET /numbering_rules/1
  # GET /numbering_rules/1.xml
  def show
    @numbering_rule = NumberingRule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @numbering_rule }
    end
  end

  # GET /numbering_rules/new
  # GET /numbering_rules/new.xml
  def new
    @numbering_rule = NumberingRule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @numbering_rule }
    end
  end

  # GET /numbering_rules/1/edit
  def edit
    @numbering_rule = NumberingRule.find(params[:id])
  end

  # POST /numbering_rules
  # POST /numbering_rules.xml
  def create
    @numbering_rule = NumberingRule.new(params[:numbering_rule])

    respond_to do |format|
      if @numbering_rule.save
        flash[:notice] = 'NumberingRule was successfully created.'
        format.html { redirect_to(@numbering_rule) }
        format.xml  { render :xml => @numbering_rule, :status => :created, :location => @numbering_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @numbering_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /numbering_rules/1
  # PUT /numbering_rules/1.xml
  def update
    @numbering_rule = NumberingRule.find(params[:id])

    respond_to do |format|
      if @numbering_rule.update_attributes(params[:numbering_rule])
        flash[:notice] = 'NumberingRule was successfully updated.'
        format.html { redirect_to(@numbering_rule) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @numbering_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /numbering_rules/1
  # DELETE /numbering_rules/1.xml
  def destroy
    @numbering_rule = NumberingRule.find(params[:id])
    @numbering_rule.destroy

    respond_to do |format|
      format.html { redirect_to(numbering_rules_url) }
      format.xml  { head :ok }
    end
  end
end
