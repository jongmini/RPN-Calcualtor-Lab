require './stack.rb'

# Do not use a ruby array!  Add your list class instead

class RPNCalculator
 
  # Parse should return a list class that you defined, not a ruby array 
  def self.parse(rpn_string)
    rpn_string.split(" ")
  end

  def self.evaluate(rpn_list)
    stack = Stack.new()
    rpn_list.each do |x| 
      if self.is_operation(x)
        stack.push(x)
        operator = stack.pop
        val2 = (stack.pop).to_f
        val1 = (stack.pop).to_f
        res = val1.public_send(operator,val2)
        stack.push(res)
      else
        stack.push(x)
      end
    end
    stack.pop
  end

  def self.is_operation(operation)
    operation.match(/[\*+-\/\^]/) ? true : false
  end
  
  def self.is_number(num)
    num.match(/\A[+-]?\d+?(_?\d+)*(\.\d+e?\d*)?\Z/) ? true : false

  end
end
