require 'twilio-ruby'
require_relative 'orders.rb'
require_relative 'sms_confirmation'

class Takeaway

  attr_reader :menu

  def initialize(orders = Orders.new, confirmation = Sms)
    @orders = orders
    @confirmation = confirmation
  end        
  
  def read_menu
    @orders.menu
  end

  def place_orders(string, number = 1)
    @orders.order(string, number)
  end

  def basket_summary
    @orders.basket_summary
  end

  def order_price
    @orders.order_price
  end

  def total
    @orders.total
  end

  def confirm_delivery
    @confirmation = @confirmation.new
    @confirmation.send_sms
  end
  
end
