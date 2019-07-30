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

    #my_any?

    def my_any?

      my_each do |e|

        return true if yield(e)

      end

      false

    end

    #my_none?

    def my_none?

      return true unless block_given?
  
      my_each do |e|

        return true unless yield(e)

      end

      false

    end


    #my_count
    
    def my_count(obj = nil)

      count = 0
   
      if block_given?

        self.my_each do |e|

          count += 1 if yield(e)

        end

      else

        if obj

          self.my_each do |e|

            count += 1 if e == obj

          end

        else

          count = self.length

        end

      end
     
      count

    end

 end