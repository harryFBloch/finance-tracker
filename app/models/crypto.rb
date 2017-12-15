class Crypto < ActiveRecord::Base
  has_many:user_cryptos
  has_many:users, through: :user_cryptos
  
  def self.new_from_lookup(ticker)
        client = Binance::Client::REST.new
        coin_array = client.klines symbol: "#{ticker}BTC", interval: '1m', limit: 1
        coin = coin_array.first
        price = coin[1]
        new(ticker: ticker, last_price: price)
  end
  
  def self.find_by_ticker(ticker)
    where(ticker: ticker).first
  end

end
