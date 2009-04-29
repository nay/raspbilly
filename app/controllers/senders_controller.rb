class SendersController < ApplicationController
  before_filter :set_title
  before_filter :find_sender, :only => [:edit, :update, :destroy]
  def index
    @senders = Sender.find(:all, :order => "created_at desc")
  end

  def new
    @title << " - 新規作成"
    @sender = Sender.new
  end

  def create
    @sender = Sender.new(params[:sender])
    if @sender.save
      redirect_to senders_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sender.update_attributes(params[:sender])
      redirect_to senders_path
    else
      render :edit
    end
  end

  def destroy
    @sender.destroy
    redirect_to_ senders_path
  end

  private
  def find_sender
    @sender = Sender.find(params[:id])
  end
  def set_title
    @title = Sender.human_name
  end

end
