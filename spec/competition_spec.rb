require 'spec_helper'

describe Competition do
  it { should belong_to :competitor}
  it { should belong_to :game}
end
