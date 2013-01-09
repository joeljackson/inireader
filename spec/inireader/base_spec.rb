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

  it "should fail on bad lines" do
    section_string = "[section_name]\n" +
      "blah blah blah\n" +
      "key1=val1\n"
    lambda do
      reader = IniReader::Base.new(section_string)
    end.should raise_error
  end

  it "should ignore lines starting with ';'" do
    section_string = "[section_name]\n" +
      ";blah blah blah\n" +
      "key1=val1\n"
    lambda do
      reader = IniReader::Base.new(section_string)
    end.should_not raise_error
  end

  it "should allow empty lines" do
    section_string = "[section_name]\n" +
      "\n" +
      "key1=val1\n"
    lambda do
      reader = IniReader::Base.new(section_string)
    end.should_not raise_error
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

    it "should force the section to have a name" do
      section_string = "[]\n"
      lambda do
        reader = IniReader::Base.new(section_string)
      end.should raise_error
    end
  end

  describe "pairs" do
    it "should not crash when assigning a pair" do
      section_string = "[section_name]\n" +
        "key1=val1\n"
      lambda do
        reader = IniReader::Base.new(section_string)
      end.should_not raise_error
    end

    it "should add a pair to the associated section" do
      section_string = "[section_name]\n" +
        "key1=val1\n"
      reader = IniReader::Base.new(section_string)
      reader[:section_name].class.should == Hash
      reader[:section_name][:key1].should == "val1"
    end

    it "should not be added to any other section" do
      section_string = "[section_name]\n" +
        "[section_name2]\n" +
        "key1=val1\n"
      reader = IniReader::Base.new(section_string)
      reader[:section_name][:key1].should == nil
    end

    it "should add keys in repeated sections with previous sections" do
      section_string = "[section_name]\n" +
        "key1=val1\n" +
        "[section_name]\n" +
        "key3=val3\n"
      reader = IniReader::Base.new(section_string)
      reader[:section_name][:key3].should == "val3"
    end

    it "should not overwrite previous sections when they are repeated" do
      section_string = "[section_name]\n" +
        "key1=val1\n" +
        "[section_name]\n" +
        "key3=val3\n"
      reader = IniReader::Base.new(section_string)
      reader[:section_name][:key1].should == "val1"
    end
  end

  it "should parse files" do
    string = "[section]\n" +
      "key1=val1\n" + 
      "key2=val2\n" +
      "key1=val3\n" +
      "\n" +
      "[section2]\n" +
      ";I am a comment. I can do anything here\n" +
      "key1=key2=val1\n" +
      "key3=val2\n"
      outfile = File.new("./string", "w")
      outfile.write(string)
      reader = IniReader.parse("./string")
      reader[:section].should == {key1: "val3", key2: "val2"}
      reader[:section2].should == {key1:"key2=val1", key3:"val2"}
  end
end