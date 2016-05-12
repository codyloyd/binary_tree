#binary tree... my own attempt.
class Node
    attr_accessor :value, :left, :right
    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end

    def to_s
      s = "value:" + @value.to_s + " ["
      s += "left:" + @left.value.to_s + " " if @left 
      s += "right:" + @right.value.to_s if @right
      s += "]"
      s
    end
    def insert(a)
      if a < self.value
        insert_left(a)
      elsif a > self.value
        insert_right(a)
      end
    end

    def insert_left(a)
      if left
        self.left.insert(a)
      else
        self.left = Node.new(a)
      end
    end

    def insert_right(a)
      if right
        self.right.insert(a)
      else
        self.right = Node.new(a)
      end
    end

    def build_tree(array)
      @root = Node.new(array[0])
      array.each_with_index do |a,i|
        next if i == 0
        @root.insert(a)
      end 
      @root  
    end

    def breadth_first_search(v)
      #uses queue
      return self if self.value == v
      q = [self]
      until q.empty?
        node = q.shift
        return node if node.value == v
        q << node.right if node.right
        q << node.left if node.left        
      end
      return nil
    end

    def depth_first_search(v)
      #uses stack
      stk = [self]
        until stk.empty?
          node = stk.pop
          return node if node.value == v
          stk << node.left if node.left
          stk << node.right if node.right
        end
    end

    def dfs_rec(v,node=self)
      @stack = [node] unless @stack
      return node if node.value == v
      
      @sol ? @sol << node : @sol = [node]
      
      if @sol.include?(node.left) || node.left == nil
        @stack.pop
        @stack << node.right if node.right
      elsif !@sol.include?(node.left) || node.left != nil       
        @stack << node.left if node.left 
      end

      return nil if @stack.empty?
      dfs_rec(v,@stack[-1])
    end

end

tree = Node.new(0)
treenew = tree.build_tree([1, 7, 4, 23, 8, 9, 3, 5, 7, 9, 67, 6345, 324])
puts treenew.dfs_rec(3)



 