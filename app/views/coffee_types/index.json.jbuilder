json.array!(@coffee_types) do |coffee_type|
      json.extract! coffee_type, :name, :image, :type_of_coffee, :temp, :caffeinated, :basicInfo, :price, :fullInfo, :drinks
      json.url coffees_url(coffee_type, format: :json)
end
