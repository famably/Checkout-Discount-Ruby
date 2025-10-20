class Checkout
  def initialize(prices)
    @prices = prices
    @basket = []
  end

  def scan(item)
    @basket << item.to_sym
  end

  def total
    grouped_items.sum { |item, count| calculate_price(item, count) }
  end

  private

  def grouped_items
    @basket.tally
  end

  def calculate_price(item, count)
    price = @prices[item]

    case item
    when :apple, :pear
      count.even? ? price * (count / 2) : price * count
    when :banana
      (price / 2) * count
    when :pineapple
      (price / 2) + (price * (count - 1))
    else
      price * count
    end
  end
end
