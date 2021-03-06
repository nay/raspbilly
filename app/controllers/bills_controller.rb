class BillsController < ApplicationController
  before_filter :find_bill, :only => [:show, :edit, :update, :destroy]

  def dhtmlxgrid
    @bills = Bill.paginate(:all, :order => "written_on desc, updated_at desc", :page => params[:page], :per_page => 5)
    respond_to do |format|
      format.xml {
        render :text => Bill.dhtmlxgrid_xml(@bills).to_s
      }
    end
  end

  def index
    @title = "請求書一覧"
    @bills = Bill.paginate(:all, :order => "written_on desc, updated_at desc", :page => params[:page], :per_page => 5)
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @bills }
    end
  end

  def new
    @bill = Bill.new
    add_default_sale_items
    add_default_out_of_pocket_items
  end

  def create
    @bill = Bill.new(params[:bill])

    if @bill.save
      flash[:notice] = "#{format_bill(@bill)}を登録しました。"
      redirect_to bill_path(:id => @bill.id)
    else
      add_default_sale_items
      add_default_out_of_pocket_items
      render :action => 'new'
    end
  end

  def update
    if @bill.update_attributes(params[:bill])
      flash[:notice] = "#{format_bill(@bill)}は正常に更新されました"
      redirect_to bill_path(:id => @bill.id)
    else
      render :action => 'edit'
    end
  end

  def edit
    add_default_sale_items
    add_default_out_of_pocket_items
  end

  def destroy
    @bill.destroy
    flash[:notice] = "#{format_bill(@bill)}を削除しました。"
    redirect_to bills_path
  end

  def add_sale_item_field
    @bill = params[:id] ? Bill.find(params[:id]) : Bill.new
    current_size = params[:bill] && params[:bill][:sale_items_attributes] ? params[:bill][:sale_items_attributes].keys.size : 0
    @bill.attributes = params[:bill]
    @bill.sale_items.build while @bill.sale_items.size < current_size + 1
    add_default_out_of_pocket_items
    render :partial => "form"
  end

  def add_out_of_pocket_item_field
    @bill = params[:id] ? Bill.find(params[:id]) : Bill.new
    current_size = params[:bill] && params[:bill][:out_of_pocket_items_attributes] ? params[:bill][:out_of_pocket_items_attributes].keys.size : 0
    @bill.attributes = params[:bill]
    @bill.out_of_pocket_items.build while @bill.out_of_pocket_items.size < current_size + 1
    add_default_sale_items
    render :partial => "form"
  end

  private

  def find_bill
    @bill = Bill.find(params[:id])
  end
  def add_default_sale_items
    size = params[:bill] && params[:bill][:sale_items_attributes] ? params[:bill][:sale_items_attributes].keys.size : 3
    p size
    @bill.sale_items.build while @bill.sale_items.size < size
  end
  def add_default_out_of_pocket_items
    size = params[:bill] && params[:bill][:out_of_pocket_items_attributes] ? params[:bill][:out_of_pocket_items_attributes].keys.size : 1
    p size
    1.times {@bill.out_of_pocket_items.build} while @bill.out_of_pocket_items.size < size
  end
end
