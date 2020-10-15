class Orders

  attr_reader :menu, :items_count

  def initialize
    @menu = { "margarita" => 6,
      "four_chesse" => 9,
      "capprese" => 8,
      "pepperoni" => 7 }
    @items_count = []
  end 

  def order(string, number)
    @number = number
    fail 'The pizza is not in the menu' unless @menu.has_key?(string)

    @item = @menu.select { |key| key.to_s == string }   
    puts "#{@number}x #{@item.keys[0]} added to your basket"
    @items_count << { @item.keys[0].to_s => @number }
  end

  def basket_summary
    @items_count.each do |item|
      item.each { |pizza, value| puts "#{pizza}, x#{value} = £#{@menu[pizza] * value}" }
    end
  end

  def order_price
    @items_count.map { |hash| 
      hash.map { |dish, value| @menu[dish] * value }
    }.flatten.inject(:+)
  end

  def total
    "Your total is: £#{order_price}."
  end

end
