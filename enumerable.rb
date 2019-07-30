module Enumerable
    #my_each

    def my_each

      for i in 0...self.length

        yield(self[i]) if block_given?

      end

    end
    
 end