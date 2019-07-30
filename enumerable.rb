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

    #my_select
    def my_select

      result = []

      self.my_each do |e|

        result << e if yield(e)

        end

       result

      end
   

    #my_all?

    def my_all?

      my_each do |e|

        return false unless yield(e)

      end

      true
      
    end

 end