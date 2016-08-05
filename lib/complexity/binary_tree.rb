module DataStructures
  module Complexity
    module BinaryTree
      def performance_test
        Asymptotic::Graph::plot(
          "Data-Structure Binary Tree Complexity",

          "Checking if an element is in a tree" => {
            function: ->(tree){ tree.exists? 1 },
            input_seeds: (1..30),
            input_function: ->(limit){ (1..limit*30).to_a.shuffle.each {|i| self.insert(i)}; self }
          }
        )
      end
    end
  end
end