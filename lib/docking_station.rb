require_relative 'bike'

class DockingStation

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end

  def dock bike
    @bike = bike
  end

end
