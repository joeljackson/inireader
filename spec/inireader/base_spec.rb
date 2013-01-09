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


  describe "sections" do
    it "should add a section when it sees a section header" do
      section_string = "[section_name]\n"
      reader = IniReader::Base.new(section_string)
      reader[:section_name].should_not == nil
    end

    it "should allow for different section names" do
      section_string = "[section_name]\n" +
        "[section_name_2]\n"
      reader = IniReader::Base.new(section_string)
      reader[:section_name].should_not == nil
      reader[:section_name_2].should_not == nil
    end
  end

  describe "pairs" do
    it "should not crash when assigning a pair" do
      section_string = "[section_name]\n" +
        "key1=val1\n"
      reader = IniReader::Base.new(section_string)
    end
  end

end