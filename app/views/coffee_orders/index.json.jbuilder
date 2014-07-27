json.array!(@coffee_orders) do |coffee_order|
  json.extract! coffee_order, 
  json.url coffee_order_url(coffee_order, format: :json)
end
