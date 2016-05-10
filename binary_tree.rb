class Node
	attr_accessor :value, :left, :right
	def initialize(value)
		@value = value
		@left = nil
		@right = nil
	end

	def insert(v)
		case v <=> value
			when -1 then insert_left(v)
			when 1 then insert_right(v)
			when 0 then false
		end
	end

	def insert_left(value)
        if left
            left.insert(value)
        else
            self.left = Node.new value
        end
    end

    def insert_right(value)
    	if right
    		right.insert(value)
    	else
    		self.right = Node.new value
    	end
    end

    def build_tree(array)
    	root = Node.new array[0]
    	array.each_with_index do |v,i|
    		next if i == 0
    		root.insert(v)
    	end
    	root

    end

    def bfs(value)
    	queue = [] # Unshift to add to queue / pop to remove from queue
    	queue.unshift(self)
    	iteration = 0
    	until queue.empty?
    		node = queue.pop
    		
    		puts iteration

    		queue.unshift node.left unless node.left.nil?
    		queue.unshift node.right unless node.right.nil?
    		puts node if value == node.value
    		
    		iteration = iteration + 1
    	end
    	nil
    end

end

tree = Node.new 0
tree.build_tree([2,5,7,6,9,10,12])
tree.bfs 10


