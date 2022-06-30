def check_timeline(lowests_index, highests_index)
  if lowests_index < highests_index
    return [lowests_index, lowests_index]
  else
    return nil
  end
end

def stock_picker(stock_prices)

end

stock_prices_example = [17,3,6,9,15,8,6,1,10]
stock_picker(stock_prices_example)
