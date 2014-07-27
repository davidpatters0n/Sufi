require 'spec_helper'

describe CoffeeType do

  before(:each) do
    @attr = {
      :name => 'MOCHA',
      :image => 'some image',
      :type_of_coffee => 'chocolate',
      :temp => '10',
      :caffeinated => true,
      :info => 'This is a mocha drink really chocolately',
      :price => '£3.68'
    }
    end

    it 'should create a new instance given a valid attribute' do
      CoffeeType.create!(@attr)
    end

    it 'should require a name' do
      no_name_coffee = CoffeeType.new(@attr.merge(:name => ''))
      no_name_coffee.should_not be_valid
    end

    it 'should require a name' do
      no_image_cofeee = CoffeeType.new(@attr.merge(:image => ''))
      no_image_cofeee = CoffeeType.should_not be_valid
    end

    it 'should require a name' do
      no_type_of_coffee = CoffeeType.new(@attr.merge(:type_of_coffee => ''))
      no_type_of_coffee = CoffeeType.should_not be_valid
    end

    it 'should require a name' do
      no_temp_coffee = CoffeeType.new(@attr.merge(:temp => ''))
      no_temp_coffee = CoffeeType.should_not be_valid
    end

    it 'should require a name' do
      no_caffeinated_coffee = CoffeeType.new(@attr.merge(:caffeinated => ''))
      no_caffeinated_coffee = CoffeeType.should_not be_valid
    end

    it 'should require a name' do
      no_info_coffee = CoffeeType.new(@attr.merge(:info => ''))
      no_info_coffee = CoffeeType.should_not be_valid
    end

    it 'should require a name' do
      no_price_coffee = CoffeeType.new(@attr.merge(:price => ''))
      no_price_coffee = CoffeeType.should_not be_valid
    end

    it 'should reject duplicate names' do
      CoffeeType.create!(@attr)
      coffee_with_duplicate_name = CoffeeType.new(@attr)
      coffee_with_duplicate_name.should_not be_valid
    end
  end

