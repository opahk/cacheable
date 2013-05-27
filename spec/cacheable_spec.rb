require 'spec_helper'

describe Cacheable do

  describe '#valid?' do
    bic = Bic.new "MARKDEFF"
    bic.valid?.should == true
  end
end
