require 'spec_helper'

describe Event do
  it { should belong_to :competitor}
  it { should belong_to :game}
end
