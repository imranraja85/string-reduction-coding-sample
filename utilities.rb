# Created by Imran Raja 
# Created on 12/18/2011

module Utilities
  class Minimizer 
    class << self
      def minimize_string(string)
        @string = string
        
        while string_has_unique_adjacent_characters?
          parse_for_strings_to_replace
        end
      
        puts @string.length
      end
      
      def parse_for_strings_to_replace
        for index in 0..@string.length
          if !end_of_string?(index) && unique_adjacent_characters?(index)
            replace_adjacent_characters(@string[index] + @string[index+1])
          end
        end
      end
      
      # Receives a two character string and replaces it with a single 3rd character
      def replace_adjacent_characters(string)
        if !string.include?("a")
          @string.sub!(string, "a")
        elsif !string.include?("b")
          @string.sub!(string, "b")
        else
          @string.sub!(string, "c")
        end
      end
      
      def string_has_unique_adjacent_characters?
        for index in 0..@string.length
          return false if end_of_string?(index)
          return true if unique_adjacent_characters?(index)
        end
      end
      
      def end_of_string?(index)
        @string[index + 1] == nil  
      end
      
      def unique_adjacent_characters?(index)
        @string[index] != @string[index+1]
      end

    end #end of class methods
  end #end of Minimizer class
end #end of module

file_handler = File.open("input001.txt")
number_of_test_cases = file_handler.readline.chomp.to_i

for i in 1..number_of_test_cases
  Utilities::Minimizer.minimize_string(file_handler.readline.chomp)  
end

