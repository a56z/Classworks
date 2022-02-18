class MyStack
    def initialize
        @store = []
    end

    def peek
        @store.last
    end

    def empty?
        @store.empty?
    end

    def pop
        @store.pop
    end

    def push(val)
        @store.push(val)
    end
end