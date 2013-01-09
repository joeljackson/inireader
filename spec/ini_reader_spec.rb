require 'spec_helper'

describe IniReader do
  it "Should exist" do
    lambda do
      IniReader.class == Class
    end.should_not raise_error
  end
end