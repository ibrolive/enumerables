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
   
    #my_map

    def my_map(&block)

      arr = []

      my_each do |e|

        arr << block.call(e)

      end

      arr

    end

    #my_inject

    def my_inject(obj=nil)

      accumulator = obj ? obj : self.shift
     
      self.my_each do |e|

        accumulator = yield(accumulator, e)

      end
     
      accumulator

    end

 end


    #method to test my_inject

    def multiply_els(arr)

      arr.my_inject { |memo, e| memo * e }

    end

    puts "multiply_els: " + multiply_els([2, 4, 5]).to_s

    #call to test my_count

    ar = [1,2,3,2,5,6]
    
    puts "my_count with argument: " + ar.my_count(2).to_s

    puts "my_count without argument: " + ar.my_count.to_s

    puts "my_count with block passed: " + ar.my_count{|x| x % 2 == 0 }.to_s

    puts "Sum without argument: " + [2, 4, 5].my_inject{|acc,nxt| acc + nxt}.to_s 