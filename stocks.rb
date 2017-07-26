def stock_picker stocks
  profit = 0
  days = []
  stocks.each do |buy|
    stocks[buy.index..-1].each do |sell|
      if sell - buy > profit
        profit = sell - buy
        days[0] = buy
        days[1] = sell
      end
    end
  end
  puts "Buy and sell on #{days} for a profit of #{profit}"
end
