class BillsController < ApplicationController
  before_filter :find_bill, :only => [:show, :edit, :update, :destroy]

  def index
    @title = "請求書一覧"
    @bills = Bill.paginate(:all, :order => "written_on desc, updated_at desc", :page => params[:page], :per_page => 5)
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(params[:bill])
    if @bill.save
      flash[:notice] = "#{format_bill(@bill)}を登録しました。"
      redirect_to bills_path
    else
      p @bill.inspect
      render :action => 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @bill.destroy
    flash[:notice] = "#{format_bill(@bill)}を削除しました。"
    redirect_to bills_path
  end

  private
  def find_bill
    @bill = Bill.find(params[:id])
  end

end
