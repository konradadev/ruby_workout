def compare(sells)
  profit = 0
  most_profit_index = nil
  sells.each_with_index do |sell, i|
    if sell[:balance] > profit
      profit = sell[:balance]
      most_profit_index = i
    end
  end
  if profit == 0
    return "There's no point in buying"
  else
    return [sells[most_profit_index][:buy_index], sells[most_profit_index][:sell_index]]
  end
end

def stock_picker(stock_prices)
  all_sells = []
  stock_prices.each_with_index do |current_price, current_price_index|
    if current_price_index == stock_prices.length-1
      result = compare(all_sells)
      print result
      puts
      return nil
    end
    prices_after_current = stock_prices[(current_price_index+1)..(stock_prices.length-1)]
    highest_price = prices_after_current.max
    highest_price_index = current_price_index + prices_after_current.index(highest_price) + 1
    sell = {
      :buy_index => current_price_index,
      :sell_index => highest_price_index,
      :balance => highest_price - current_price
    }
    all_sells.push(sell)
  end
end

stock_prices_example0 = [17,3,6,9,15,8,6,1,10]
stock_prices_example1 = [1,3,6,9,15,8,6,1,10]
stock_prices_example2 = [17,3,6,9,15,8,6,1,18]
stock_prices_example3 = [17,15,15,14,13,13]
stock_picker(stock_prices_example0)
stock_picker(stock_prices_example1)
stock_picker(stock_prices_example2)
stock_picker(stock_prices_example3)
