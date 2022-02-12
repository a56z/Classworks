module Searchable
    def dfs(target_value = nil, &prc)
        raise "Need a proc or target!" if [target_value, prc].none?
        prc ||= Proc.new{  |node| node.value == target_value }

        return self if prc.call(self)
            
            children.each do |child|
                result = child.dfs(&prc)
                return result unless result.nil?
            end
            nil
    end

    def bfs(target_value = nil, &prc)
        raise "Need a proc or target!" if [target_value, prc].none?
        prc ||= Proc.new{  |node| node.value == target_value }

        nodes = [self]
        until nodes.empty?
            node = nodes.shift

            return node if prc.call(node)
            nodes.concat(node.children)
        end
        nil
    end
    
end


class PolyTreeNode
    include Searchable

    attr_accessor :value
    attr_reader :parent
    def initialize(value = nil)
        @value, @parent, @children = value, nil, []
    end

    def children
        @children.dup
    end

    def parent=(parent)
        return if self.parent == parent

        if self.parent
            self.parent._children.delete(self)
        end

        @parent = parent

        self.parent._children << self unless self.parent.nil?

        self
    end

    def remove_child(child)
        if child && !self.children.include?(child)
            raise "You tried to remove a node that isn't a child!"
        end
        child.parent = nil
    end

    def add_child(child)
        child.parent = self    
    end

    protected

    def _children
        @children
    end
end