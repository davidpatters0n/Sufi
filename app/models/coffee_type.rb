class CoffeeType < ActiveRecord::Base
  has_many :coffee_items
  #validates_presence_of :name, :image, :type_of_coffee, :temp, :caffeinated, :basicInfo, :price, :fullInfo, :drinks
  #validates_uniqueness_of :name
   def self.search(search = nil)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end 

   def self.filter(filter_criteria = nil)
    if filter_criteria
      where('type_of_coffee LIKE ?', "#{filter_criteria}%")
    else
      where(nil)
    end
   end
end
