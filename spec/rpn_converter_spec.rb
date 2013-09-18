require 'spec_helper'
require_relative '../rpn_converter'

describe RpnConverter do

  describe ".to_postfix" do
    subject(:converter) { RpnConverter }

    it { converter.to_postfix("2 + 1 - 12 / 3").should == "2 1 12 3 / - +" }
    it { converter.to_postfix("( 6 - 3 ) ^ 2 - 11").should == "6 3 - 2 ^ 11 -" }
    it { converter.to_postfix("128 / ( 2 + 1 ) ^ 4").should == "128 2 1 + 4 ^ /" }
    it { converter.to_postfix("3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3").should == "3 4 2 * 1 5 - 2 3 ^ ^ / +" }
  end
end