require 'byebug'

class Array
  def my_uniq
    result = []
    self.each do |el|
      result << el unless result.include?(el)
    end
    result
  end

  def two_sum
    result = []
    self.each_index do |idx|
      idx2 = idx + 1
      while idx2 < self.length
        if (self[idx] + self[idx2]).zero?
          result << [idx, idx2]
        end

        idx2 += 1
      end
    end

    result
  end
end

def my_transpose(array)
  result = Array.new(array.length) {[]}
  array.each_with_index do |el, idx|
    el.each_with_index do |el2, idx2|
      result[idx2] << el2
    end
  end
  result
end

def stock_picker(arr)
  result = []
  greatest_diff = 0
  arr.each_index do |idx|
    idx2 = idx + 1
    while idx2 < arr.length
      currrent_diff = arr[idx2] - arr[idx]
      if currrent_diff > greatest_diff
        greatest_diff = currrent_diff
        result = [idx, idx2]
      end

      idx2 += 1
    end
  end

  result
end

class TowersOfHanoi
  attr_reader :tower_one, :tower_two, :tower_three

  def initialize(tower_one = [3, 2, 1], tower_two = [], tower_three = [])
    @tower_one = tower_one
    @tower_two = tower_two
    @tower_three = tower_three
    @towers_array = [@tower_one, @tower_two, @tower_three]
  end

  def move(from, to)
    if valid_move?(from, to)
      from_disc = @towers_array[from].pop
      @towers_array[to] << from_disc
    end
  end

  def valid_move?(from, to)

    return false if @towers_array[from].empty?
    return true if  @towers_array[to].empty?
    return false if @towers_array[from].last > @towers_array[to].last
    true
  end

  def won?
    # debugger
    return true if @tower_two.length == 3 || @tower_three.length == 3
    false
  end
end
