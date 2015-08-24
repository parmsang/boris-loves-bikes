require 'docking_station'

describe DockingStation do
  it{ is_expected.to respond_to :release_bike }

  it 'releases bikes' do
    subject.release_bike
  end
end
