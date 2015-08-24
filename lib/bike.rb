class Bike

  def initialize
    @working = true
    @chosen = false
  end

  def working?
    @working
  end

  def report_broken
    @working = false
  end

  def fix
    @working = true
  end

  attr_accessor :chosen

end
