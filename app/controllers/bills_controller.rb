class BillsController < ApplicationController
  def index
    @title = "請求書一覧"
    @bills = Bill.paginate(:all, :order => "written_on desc", :page => params[:page])
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

end
