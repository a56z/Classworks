# arr.each_with_index do |el1, idx1| 
#     arr.each_with_index do |el2, idx2|
#         if idx2 > idx1 && el1.length >= el2.length
#             new_arr << el1
#         else
#             new_arr << el2
#         end
#     end
#     p new_arr.length.max
# end



fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

# quadratic search
def quadratic_biggest_fish(fishes)
    fishes.each_with_index do |fish1, i1|
        max_length = true

        fishes.each_with_index do |fish2, i2|
            next if i1 == i2
            max_length = false if fish2.length > fish1.length
        end
        return fish1 if max_length
    end
end

quadratic_biggest_fish(fishes)

# def binary_fish_search(fishes)
#     arr_left = []
#     arr_right = []
#     left_fish = fishes.length < mid_fish
#     mid_fish = fishes.length / 2
#     right_fish = fishes.length >= mid_fish

#     fishes.each_with_index do |fish, idx|
#         if left_fish < mid_fish
#             arr_left << fish
#         elsif
#             right_fish >= mid_fish
#             arr_right << fish
#         end
#     end
#     right_fish.sort.last
# end

# binary_fish_search(fishes)
class Array
    def merge_sort(&prc)
        prc ||= Proc.new { |x, y| x <=> y }
        return self if count <= 1

        midpoint = count / 2
        sorted_left = self.take(midpoint).merge_sort(&prc)
        sorted_right = self.drop(midpoint).merge_sort(&prc)

        Array.merge(sorted_left, sorted_right, &prc)
    end

    private
    def self.merge(left, right, &prc)
        merged = []

        until left.empty? || right.empty?
            case prc.call(left.first, right.first)
            when -1
                merged << left.shift
            when 0
                merged << left.shift
            when 1
                merged << right.shift
        end
        merged.concat(left)
        merged.concat(right)
    end
end


# def bubble_fish(fishes)
#     sorted_arr = []
#     sorted = false
#     fishes.each_with_index do |fish, idx|
#         while false
#             if fish[idx] > fish[idx2]
#                 fish[idx], fish[idx+1] = fish[idx+1], fish[idx]
#             end
#         end
#         sorted = true
#     end
# end

def nlogn_biggest_fish(fishes)
    # sort the array longest to shortest
    prc = Proc.new { |x, y| y.length <=> x.length }
    #return the first element
    fishes.merge_sort(&prc)[0]
  end
  
  # linear search
  def linear_biggest_fish(fishes)
    #hold the biggest fish
    biggest_fish = fishes.first
  
    fishes.each do |fish|
      if fish.length > biggest_fish.length
        #update the biggest fish
        biggest_fish = fish
      end
    end
  
    biggest_fish
  
  end
  
  # linear octopus dance
  # tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
  
  def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |tile, index|
      return index if tile == direction
    end
  end
  
  # constant octopus dance
  #use a hash for constant lookup
  tiles_hash = {
      "up" => 0,
      "right-up" => 1,
      "right"=> 2,
      "right-down" => 3,
      "down" => 4,
      "left-down" => 5,
      "left" => 6,
      "left-up" => 7
  }
  
  def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
  end

