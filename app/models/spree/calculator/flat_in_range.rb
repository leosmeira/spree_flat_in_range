module Spree
  class Calculator::FlatInRange < Calculator
    preference :lower_boundry,    :decimal, :default => 0.0
    preference :upper_boundry,    :decimal, :default => 50.0
    preference :amount,           :decimal, :default => 5.0
    attr_accessible :preferred_lower_boundry, :preferred_upper_boundry, :preferred_amount
    
    def self.description
      I18n.t(:flat_in_range)
    end

    def compute(object)
      return self.preferred_amount
    end
    
    def available?(object)
      item_total = object.line_items.map(&:amount).sum
      if (item_total >= self.preferred_lower_boundry && item_total <= self.preferred_upper_boundry)
        return true
      else
        return false
      end
    end
      
  end
end
