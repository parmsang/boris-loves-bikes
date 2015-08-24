module BikeContainer
  DEFAULT_CAPACITY = 20


  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @bikes = []
  end


  attr_reader :capacity

  def add_bike bike
    raise "#{self.class.name} full" if full?
    bikes << bike
  end

  def remove_bike
    raise "#{self.class.name} empty" if empty?
    bikes.pop
  end

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

  private

  attr_reader :bikes

end
