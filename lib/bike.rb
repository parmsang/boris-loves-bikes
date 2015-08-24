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

  def choose
    @chosen = true
  end

  def chosen?
    @chosen
  end

end
