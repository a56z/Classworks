class PolyTreeNode

    attr_accessor :value
    attr_reader :parent

    def initialize(value = nil)
        @value, @parent, @children = value, nil, []
    end

    def parent=(parent)
        @parent
        return if self.parent == parent

        @parent = parent
        self.parent._children << self << unless self.parent.nil?
        self
    end
end
end