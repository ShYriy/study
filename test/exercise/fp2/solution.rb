module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        i = 0
        while i < length
          yield self[i]
          i += 1
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        my_each { |elem| result << yield(elem) }
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        my_each { |elem| result << elem unless elem.nil? }
        result
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        my_each { |elem| acc = acc.nil? ? elem : yield(acc, elem) }
        acc
      end
    end
  end
end
