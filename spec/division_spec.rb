require 'spec_helper'

describe Division do
  it { should have_many :competitors}

  it 'validates the presence of a name' do
    division = Division.new ({:name => ''})
    expect(division.save).to eq false
  end

  it 'converts the name to titlecase' do
    division = Division.create(:name => "pro")
    expect(division.name).to eq "Pro"
  end
end
