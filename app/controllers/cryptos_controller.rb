class CryptosController < ApplicationController
  
  def search
    if params[:crypto].blank? 
      flash.now[:danger] = "you have ented an empty search string"
    else
      @crypto = Crypto.new_from_lookup(params[:crypto])
      flash.now[:crypto] = "You Have Entered An Invalid Symbol" unless @crypto
    end
     render partial: 'users/cryptoresult'
  end
end