class VendingMachine

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @proceeds = 0
    item = Item.new
    @stock = [item.coke, item.redbull, item.water]
  end

  def current_slot_money
    @slot_money
  end

  def slot_money(money)
    if MONEY.include?(money)
      @slot_money += money
      self.can_purchase_list
      nil
    else
      money
    end
  end

  def return_money
    slot_money = @slot_money
    @slot_money = 0
    slot_money
  end

  def can_purchase_list
    @can_purchase = []
    @stock.map {|stock|
      if stock != [] && @slot_money >= (stock[0][:price]).to_i
        @can_purchase << stock
      else
        @can_purchase << []
      end
    }
  end

  def purchase(x)
    if @can_purchase[x] != []
      @slot_money -= (@can_purchase[x][0][:price]).to_i
      @proceeds += (@can_purchase[x][0][:price]).to_i
      @stock[x].shift
      self.return_money
    else
    end
  end

  def current_proceeds
    @proceeds
  end


end

class Stocks
  def stock_info(menu_price, menu_name, number)
    menu = {price: "#{menu_price}",name: "#{menu_name}"}
    stock = []
    number.times do
      stock << menu
    end
    stock
  end
end

class Item
  def coke
    stock = Stocks.new.stock_info(120, "coke", 5)
  end

  def redbull
    stock = Stocks.new.stock_info(200, "Red Bull", 5)
  end

  def water
    stock = Stocks.new.stock_info(100, "water", 5)
  end
end
