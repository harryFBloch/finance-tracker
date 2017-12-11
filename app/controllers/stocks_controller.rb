class StocksController < ApplicationController
 
  def search
    if params[:stock].blank? 
      flash.now[:danger] = "you have ented an empty search string"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You Have Entered An Invalid Symbol" unless @stock
    end
     render partial: 'users/result'
  end
end
