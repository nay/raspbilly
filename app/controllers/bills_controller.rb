class BillsController < ApplicationController
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
      flash[:notice] = "請求書（#{@bill.subject.blank? ? "件名なし" : ERB::Util.h(@bill.subject)}）を登録しました。"
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
  end

end
