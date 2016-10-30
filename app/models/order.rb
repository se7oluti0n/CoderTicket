class Order < ApplicationRecord
  has_many :order_details

  validates_presence_of :name, :email, :phone, :address
end
