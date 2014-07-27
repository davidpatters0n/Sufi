class CoffeeTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :type_of_coffee, :temp, :caffeinated, :basicInfo, :price, 
             :fullInfo, :drinks
end
