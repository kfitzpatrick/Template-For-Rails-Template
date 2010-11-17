require File.dirname(__FILE__) + '/../spec_helper'

describe Foo do
  it "should be valid" do
    Foo.new.should be_valid
  end
end
