class PolyTreeNode

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