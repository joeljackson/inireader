require 'spec_helper'

describe IniReader do
  it "Should exist" do
    lambda do
      IniReader.class == Module
    end.should_not raise_error
  end
end