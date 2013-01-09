describe IniReader::Base do
  it "should exist" do
    lambda do
      reader = IniReader::Base.new
    end.should_not raise_error
  end

  it "should return nil if looking for a section that doesn't exist" do
    reader = IniReader::Base.new
    reader[:section_name].should == nil
  end

  it "should add a section when it sees a section header" do
    section_string = "[section_name]\n"
    reader = IniReader::Base.new(section_string)
    reader[:section_name].should_not == nil
  end
end