require_relative './00_tree_node.rb'

POSSIBLE_MOVES {
    [2,1],
    [1,2],
    [2,-1],
    [-2,1],
    [-1,2],
    [1,-2],
    [-2,-1],
    [-1,-2]
}

class KnightPathFinder
    attr_reader :start_pos
    
    kpf = KnightPathFinder.new([0, 0])

    def intitialize(start_pos)
        @start_pos = start_pos
        @considered_positions = [start_pos]

        build_move_tree
    end

    def self.valid_moves(pos)
        valid_moves = [] 
        
        cur_x, cur_y = pos
        POSSIBLE_MOVES.each do |(dx, dy)|
            new_pos = [cur_x + dx, cur_y + dy]

            if new_pos.all? { |coord| coord.between(0, 7) }
                valid_moves << new_pos
            end
        end
        valid_moves
    end

    #using bfs here
    def find_path(end_position)
        end_node = root_node.bfs(end_position)

        trace_path_back(end_node)
            .reverse
            .map(&:value)
    end

    private_constant :POSSIBLE_MOVES

    attr_accessor :root_node, :considered_positions

    def build_move_tree(start_pos)
        self.root_node = PolyTreeNode.new(start_pos)
        
        #bfs starts here
        nodes = [root_node]
        until nodes.empty?
            current_node = nodes.shift
            new_move_positions(current_pos).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_node)
                nodes << next node
            end
        end
    end



    def considered_positions
        @considered_positions = [0, 0]
    end

    def new_move_positions(pos)
        KnightPathFinder.valid_moves(pos)
            .reject { |new_pos| considered_positions.inlude?(new_pos) }
            .each { |new_pos| considered_positions << new_pos }
    end

    def trace_path_back(end_node)
        node = end_node
        until current_node.nil
            nodes << current_node
            current_node = current_node.parent
        end
        nodes
    end
end