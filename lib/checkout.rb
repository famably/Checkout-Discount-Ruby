class Checkout
  def initialize(prices, discount_repository = DiscountRepository.new)
    @prices = prices
    @discount_repository = discount_repository
    @basket = []
  end

  def scan(item)
    @basket << item.to_sym
  end

  def total
    grouped_items.sum { |item, count| rule_for(item).calculate(count) }
  end

  private

  def grouped_items
    @basket.tally
  end

  def rule_for(item)
    price = @prices.fetch(item)
    type = @discount_repository.find_discount_for(item)
    case type
    when :two_for_one
      TwoForOneRule.new(price)
    when :half_price
      HalfPriceRule.new(price)
    when :first_half_price
      FirstHalfPriceRule.new(price)
    when :buy_three_get_one
      BuyThreeGetOneFreeRule.new(price)
    else
      NoOfferRule.new(price)
    end
  end
end

# === Pricing Rules ===
class PricingRule
  attr_reader :price
  def initialize(price)
    @price = price
  end
end

class NoOfferRule < PricingRule
  def calculate(qty)
    price * qty
  end
end

class TwoForOneRule < PricingRule
  def calculate(qty)
    (qty / 2.0).ceil * price
  end
end

class HalfPriceRule < PricingRule
  def calculate(qty)
    (price / 2.0) * qty
  end
end

class FirstHalfPriceRule < PricingRule
  def calculate(qty)
    return 0 if qty.zero?
    (price / 2.0) + ((qty - 1) * price)
  end
end

class BuyThreeGetOneFreeRule < PricingRule
  def calculate(qty)
    groups_of_four = qty / 4
    remainder = qty % 4
    payable_items = (groups_of_four * 3) + remainder
    price * payable_items
  end
end

class DiscountRepository
  def initialize
    @discounts = {
      apple: :two_for_one,
      pear: :two_for_one,
      banana: :half_price,
      pineapple: :first_half_price,
      mango: :buy_three_get_one
    }
  end

  def find_discount_for(item)
    @discounts[item]
  end
end