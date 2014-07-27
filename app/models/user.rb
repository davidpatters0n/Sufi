class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :coffee_orders

  #validates_format_of :name, :with => /^[^0-9`!@#\$%\^&*+_=]+$/, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_length_of :password, :minimum => 6, :allow_blank => true
end
