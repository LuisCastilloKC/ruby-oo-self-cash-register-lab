
class CashRegister
    
    attr_accessor :total, :discount, :last_transaction
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = nil
        @last_transaction_name = nil
    end

    def add_item(title, price, quantity = 1)
        i = 0
        while i < quantity do
            @items << title
            @last_transaction = price * quantity
            @last_transaction_name = title
            i += 1
        end
        self.total += price * quantity
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else
            self.total -= (self.total * (self.discount / 100.0))
            "After the discount, the total comes to $#{self.total.round}."
        end
    end
    def items
        @items
    end

    def void_last_transaction
        items.delete(@last_transaction_name)
        if items.empty?
            self.total = 0.0
        else
            self.total -= @last_transaction
        end
    end
end


# CashRegister
# ::new
#   sets an instance variable @total on initialization to zero
#   optionally takes an employee discount on initialization
# #total
#   returns the current total
# #add_item
#   accepts a title and a price and increases the total
#   also accepts an optional quantity
#   doesn't forget about the previous total
# #apply_discount
#   the cash register was initialized with an employee discount
#     applies the discount to the total price
#     returns success message with updated total
#     reduces the total
#   the cash register was not initialized with an employee discount
#     returns a string error message that there is no discount to apply
# #items
#   returns an array containing all items that have been added
# #void_last_transaction
#   subtracts the last item from the total
#   returns the total to 0.0 if all items have been removed

# Finished in 0.00745 seconds (files took 0.12876 seconds to load)
# 13 examples, 0 failures