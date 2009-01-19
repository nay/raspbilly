class BillItemsController < ApplicationController

  def new
    # TODO: render different view by type
    render :partial => "new"
  end
end
