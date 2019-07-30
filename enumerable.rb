module Enumerable
    #my_each

    def my_each

      for i in 0...self.length

        yield(self[i]) if block_given?

      end

    end

    #my_each_with_index
    
    def my_each_with_index

      for i in 0...self.length

         yield(self[i], i)

      end

    end

 end