# Exercise 1 - Stack
#
# Let's write a Stack class. To do this, use the following framework:
#
#   class Stack
#     def initialize
#       # create ivar to store stack here!
#     end
#
#     def add(el)
#       # adds an element to the stack
#     end
#
#     def remove
#       # removes one element from the stack
#     end
#
#     def show
#       # return a copy of the stack
#     end
#   end
# To test that your code works, create a new instance of the Stack class, and play around with adding and removing elements. Remember, a stack follows the principle of LIFO!

class Stack
  def initialize
    @stack_array = []
  end

  def add(el)
    @stack_array.push(el)
  end

  def remove
    @stack_array.pop
  end

  def show
    @stack_array
  end
end
