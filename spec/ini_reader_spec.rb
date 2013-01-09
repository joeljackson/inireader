describe IniReader do
  it "Should exist" do
    lamda do
      IniReader.new
    end.should_not raise_error
  end
end