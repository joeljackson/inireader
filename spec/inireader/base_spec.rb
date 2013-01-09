describe IniReader::Base do
  it "should exist" do
    lambda do
      reader = IniReader::Base.new
    end.should_not raise_error
  end
end