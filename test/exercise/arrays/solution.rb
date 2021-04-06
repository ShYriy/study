module Exercise
  module Arrays
    class << self
      def replace(array)
        max = find_max(array)
        array.map { |elem| (elem < 0) ? elem : max }
      end

      def find_max(array)
        array.reduce(array.first) { |acc, el| el > acc ? el : acc }
      end

      def search(array, query, first = 0, last = array.length - 1)
        return -1 if first > last || query < array[first] || query > array[last]

        middle = (first + (last - first) / 2)
        return middle if array[middle] == query

        if array[middle] > query
          search(array, query, first, middle - 1)
        else
          search(array, query, middle + 1, last)
        end
      end
    end
  end
end
