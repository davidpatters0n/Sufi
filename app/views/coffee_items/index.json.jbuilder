json.array!(@coffee_items) do |coffee_item|
  json.extract! coffee_item, 
  json.url coffee_item_url(coffee_item, format: :json)
end
