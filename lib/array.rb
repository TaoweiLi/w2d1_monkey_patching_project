# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    return dif = self.max - self.min
  end

  def average
    return nil if self.length == 0
    return self.sum  / (self.length * 1.0)
  end

  def median
    mid_index = self.length / 2
    return nil if self.length == 0
    if self.length % 2 != 0
      return self.sort[mid_index]
    else
      return (self.sort[mid_index - 1] + self.sort[mid_index]) / 2.0
    end
  end

  def counts
    hash = {}
    self.each do |ele|
      if hash.key?(ele)
        hash[ele] += 1
      else
        hash[ele] = 1
      end
    end

    return hash
  end

  def my_count(value)
    counter = 0

    self.each do |ele|
      if ele == value
        counter += 1
      end
    end  

    return counter
  end

  def my_index(value)
    return nil if !self.include?(value)
    self.each_with_index do |ele, i|
      if ele == value
        return i 
      end
    end        
  end

  def my_uniq
    hash = {}

    self.each do |ele|
      if hash.key?(ele)
        hash[ele] += 1
      else
        hash[ele] = 1
      end
    end

    return hash.keys
  end

  def my_transpose
    height = self.length
    width = self.length
    new_arr = Array.new(height) {Array.new(width)}

    (0...height).each do |i|
      (0...width).each do |j|
        new_arr[i][j] = self[j][i]
      end
    end
      
    return new_arr
  end
end
