class UserCryptosController < ApplicationController
  
  def create
    name = params[:crypto_ticker]
    puts name
    crypto = Crypto.find_by_ticker(name)
    if crypto.blank?
      crypto = Crypto.new_from_lookup(name)
      puts crypto.ticker
      crypto.save
    end
    @user_crypto = UserCrypto.create(user: current_user, crypto: crypto)
    puts @user_crypto
    flash[:success] = "Crypto #{@user_crypto.crypto.ticker} was successfully added to portfolio"
    redirect_to my_portfolio_path
  end
  
  def destroy 
     crypto = Crypto.find(params[:id])
    @user_crypto = UserCrypto.where(user_id: current_user.id, crypto_id: crypto.id).first
    @user_crypto.destroy
    flash[:notice] = "Crypto was successfully removed from portfolio"
    redirect_to my_portfolio_path
  end
end
